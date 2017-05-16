Liquid l,air;
Mover mover;
void setup(){
size(600,400);
mover = new Mover(30,30,15);
l =new Liquid(0,height/2,width,height,0.05,150);
air = new Liquid(0,0,width,height/2,0.005,220);

}
void draw(){
background(242); 
//Liquid
air.display();
l.display();
if(mover.isInside(l)){
mover.drag(l);
}
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