class Mover {
  float x,y,r;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  boolean pulled=false;
  Mover(float x_,float y_,float m_) {
    x=x_;
    y=y_;
    
    mass = m_;
    r= mass*5;
    location = new PVector(x,y);
    velocity = new PVector(0,sqrt(8/(location.x-(width/2))));
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
  applyForce(mouse);
  }
  
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
 
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,r,r);
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