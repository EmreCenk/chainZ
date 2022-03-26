


float angle = radians(36);
int n = 2; // number of points
int spacing = 200;

PVector p1 = polar_to_cartesian(spacing, radians(0));
PVector p2 = new PVector(0, 0);
animation anim = new animation();

void generate_points(){
  PVector point;
  anim.reset_points();
  for (int i = 0; i<n; i++){
    point = new PVector(spacing*i + width/2 - (spacing*n/2), height/2);
    anim.add_point(point, (i+1)*10);
  }
}
void setup(){
  background(0);
  size(1000, 1000);
  
  



  strokeWeight(3);
  frameRate(60);  
}

void draw(){
  background(0);
  
  generate_points();
  for (int i = 0; i<102; i++){anim.update(); anim.display();}
  //spacing+=1;
  
  for (int i = 0; i<anim.angles.size(); i++) anim.angles.set(i, anim.angles.get(i) + (radians(1)*pow(-1, i))%360);

  stroke(255);
  anim.display();
  
  //anim.update();
  


}
