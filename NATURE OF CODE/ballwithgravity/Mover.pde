class Mover {
  int x,y,r;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  boolean pulled=false;
  Mover(int x_,int y_,int r_) {
    x=x_;
    y=y_;
    r=r_;
    mass = 1;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
 
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  void checkPull(){
  if((mouseX-location.x)*(mouseX-location.x)+(mouseY-location.y)*(mouseY-location.y)<r*r && mousePressed){
    pulled=true;
  
  
  }
  if(!mousePressed){
    pulled=false;
  
  }
  if(pulled){
  line(mouseX,mouseY,location.x,location.y);
  PVector mouse = new PVector(mouseX,mouseY);
  mouse.sub(location);
  mouse.normalize();
  mouse.mult(0.7);
  mover.applyForce(mouse);
  }
  
  }
  boolean isInside(Liquid l) {
  if (location.x>l.x && location.x<l.x+l.w && location.y>l.y && location.y<l.y+l.h)
  {
    return true;
  } else {
    return false;
  }
}

 void drag(Liquid l) {
 
    float speed = velocity.mag();
    float dragMagnitude = l.c * speed * speed;
 
    PVector drag = velocity.get();
    drag.mult(-1);
    drag.normalize();
 
    drag.mult(dragMagnitude);
 
    applyForce(drag);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
 
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,mass*r,mass*r);
  }
 
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
 
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
     if (location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    }
  }
}