Mover[] movers = new Mover[10];
 
Attractor a;
 
void setup() {
  size(400,400);
  for (int i = 0; i < movers.length; i++) {


    movers[i] = new Mover(random(width),random(height),random(0.1,2));
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