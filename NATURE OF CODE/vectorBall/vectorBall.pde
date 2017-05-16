Mover mover;
void setup(){
  size(600,400);
  mover = new Mover();
}
void draw(){
  
  
  mover.update();
  mover.display();
  mover.checkEdges();
 
}