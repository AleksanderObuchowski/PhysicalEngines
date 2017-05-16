class Liquid {
  float x,y,w,h;
  int a;
  float c;
 
  Liquid(float x_, float y_, float w_, float h_, float c_, int a_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
    a =a_;
  }
 
  void display() {
    noStroke();
    fill(0,0,a,40);
    rect(x,y,w,h);
  }
 
}