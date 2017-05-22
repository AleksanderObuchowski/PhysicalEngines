// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(20);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    noStroke();
    fill(244,0,0, mass/40);
    ellipse(position.x, position.y, 4, 4);
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(position, m.position);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance, 5.0, 250.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction

    float strength = (g * mass * m.mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength);                                         // Get force vector --> magnitude * direction
    if(distance>30){
     return  force.mult(0);
    }
    return force;
  }


}