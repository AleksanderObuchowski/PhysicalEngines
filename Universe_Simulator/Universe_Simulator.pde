import interfascia.*;
PImage photo;
GUIController c;
IFButton b1,b2;
boolean play=false;
Mover[] movers = new Mover[2500];
 
float g = 0.4;
 
void setup() {
  size(500,500);
  c = new GUIController (this);
  b1 = new IFButton ("play", width-40, height-17, 40, 17);
  b2 = new IFButton ("restart", width-100, height-17, 40, 17);
  b1.addActionListener(this);
  b2.addActionListener(this);
  c.add (b1);
  c.add (b2);
  
  photo = loadImage("1.jpg");
  loadPixels();
  image(photo, 0, 0);
  for (int i = 0; i < 2500; i+=1) {
    movers[i] = new Mover(1,i*10%photo.width,(i*10)/photo.width*10);
    movers[i].mass= brightness(photo.get(int(movers[i].position.x),int(movers[i].position.y)))*10;
    print(movers[i].mass+"  "); 
}
}
 
void draw() {
  image(photo, 0, 0);
 
  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {


      if (i != j) {
        PVector force = movers[j].attract(movers[i]);
        movers[i].applyForce(force);
      }
    }
    if(play){
    movers[i].update();}
    movers[i].display();
  }
}
void actionPerformed (GUIEvent e) {
  if (e.getSource() == b1) {
   play=!play;
  }
  if (e.getSource() == b2) {
    for (int i = 0; i < 2500; i+=1) {
    movers[i] = new Mover(1,i*10%photo.width,(i*10)/photo.width*10);
    movers[i].mass= brightness(photo.get(int(movers[i].position.x),int(movers[i].position.y)))*10;
    print(movers[i].mass+"  "); 
}
  }
}