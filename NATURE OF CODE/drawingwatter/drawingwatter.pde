import interfascia.*;

GUIController c;
IFButton b1;
Liquid air;
Liquid[] l = new Liquid[100];
boolean drawing =false,lqd=false;
int x,y,x2,y2,n=0;
Mover mover;


void setup(){
  size(600,400);
  mover = new Mover(30,30,15);
  air = new Liquid(0,0,width,height,0.005,20);
  c = new GUIController (this);
  b1 = new IFButton ("Liquid", width-40, height-17, 40, 17);
  b1.addActionListener(this);
  c.add (b1);
}
void draw(){
background(242); 
//Liquid

if(mover.isInside(air)){
mover.drag(air);
}

//Gravity
PVector gravity = new PVector(0,0.5);
mover.applyForce(gravity);
  if(!mousePressed && lqd){
    if(drawing){
    l[n]= new Liquid(x,y,x2-x,y2-y,0.05,124);
    n++;
    lqd=false;
}
    
    drawing=false;
    
  
  }
  if(mousePressed && lqd){
    if(!drawing){
      x=mouseX;
      y=mouseY;
      drawing = true;

}
    if(drawing){
      x2= mouseX;
      y2= mouseY;
      fill(255);
      rect(x,y,x2-x,y2-y);
    }

}
for(int i=0;i<n;i++){
  
  l[i].display();
  if(mover.isInside(l[i])){
    mover.drag(l[i]);
  }

}
//Mover  
mover.display();
mover.update();
mover.checkEdges();
mover.checkPull();
}

void actionPerformed (GUIEvent e) {
  if (e.getSource() == b1) {
   lqd= !lqd;
  }
}