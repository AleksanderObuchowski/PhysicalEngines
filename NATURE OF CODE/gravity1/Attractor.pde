class Attractor {
float G = 0.4;

  float mass;
  PVector location;
 
  Attractor() {
    location = new PVector(width/2,height/2);
    mass = 20;
  }
  PVector attract(Mover m){
    PVector force= PVector.sub(location,m.location);
    float distance = force.mag();
    
    force.normalize();
    float strength = (G*mass*m.mass)/(distance*distance);
    force.mult(strength);
    return force;
  
  
  }
  void display() {
    stroke(0);
    fill(#FCFF6A);
    ellipse(location.x,location.y,mass*5,mass*5);
  }
}