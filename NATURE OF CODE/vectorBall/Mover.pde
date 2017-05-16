class Mover{
  PVector position,velocity,mouse,dir,acceleration;
  Mover(){
    position = new PVector(200,200);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  void update(){
    background(242);
    if(mousePressed){
      mouse = new PVector(mouseX,mouseY);
      dir = PVector.sub(mouse,position);
      dir.normalize();
      dir.mult(0.5);
      acceleration=dir; 
      velocity.add(acceleration);
    }
    
    velocity.limit(10);
    position.add(velocity); 
  }
  void display(){
  stroke(0);
  fill(123);
  ellipse(position.x,position.y,15,15);
  if(mousePressed){
    fill(255,0,0);
    ellipse(mouseX,mouseY,3,3);
    line(mover.position.x,mover.position.y,mouseX,mouseY);
  }
  
  }
  void checkEdges(){
  if (position.x > width || position.x<0){
    velocity.x*=-1;
  }
  if (position.y > height || position.y<0){
    velocity.y*=-1;
  }
  
  }

}