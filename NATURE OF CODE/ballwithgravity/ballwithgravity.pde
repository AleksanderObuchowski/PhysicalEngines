Liquid air;
Mover mover;
void setup(){
size(600,400);
mover = new Mover(30,30,15);
air = new Liquid(0,0,width,height,0.005,220);

}
void draw(){
background(242); 
//Liquid
air.display();

if(mover.isInside(air)){
mover.drag(air);
}
//Mover  
mover.display();
mover.update();
mover.checkEdges();
mover.checkPull();
//Gravity
PVector gravity = new PVector(0,0.5);
mover.applyForce(gravity);

}