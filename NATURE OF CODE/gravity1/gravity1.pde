Mover[] movers = new Mover[5];
 
Attractor a;
 
void setup() {
  size(700,700);
  for (int i = 0; i < movers.length; i++) {


    movers[i] = new Mover(random(width/2),height/2,random(0.1,3));
  }
  a = new Attractor();
}
 
void draw() {
  background(255);
 
  a.display();
 
  for (int i = 0; i < movers.length; i++) {


    PVector force = a.attract(movers[i]);
    movers[i].applyForce(force);
 
    movers[i].update();
    movers[i].display();
  }
}