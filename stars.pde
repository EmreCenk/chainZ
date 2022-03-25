
int r = 500;
float angle = radians(36);

PVector p1 = polar_to_cartesian(r, radians(0));
PVector p2 = new PVector(0, 0);
animation anim = new animation();

void setup(){
  background(0);
  size(1000, 1000);
  p1.x += width/2;
  p1.y += height/2;
  p2.x += width/2;
  p2.y += height/2;
  
  anim.add_point(p1, 18);
  anim.add_point(p2, 18);
  strokeWeight(3);
  frameRate(1);

}

void draw(){
  //background(0);
  anim.update();
  stroke(255);
  anim.display();


}
