


float angle = radians(88);
int n = 2; // number of points
int spacing = 150;
int generations = 25;



PVector p1 = polar_to_cartesian(spacing, radians(0));
PVector p2 = new PVector(0, 0);

boolean in_slow_motion = false;
boolean screen_is_paused = false;
animation anim = new animation();

void generate_points(){
  PVector point;
  anim.reset_points();
  for (int i = 0; i<n; i++){
    point = new PVector(spacing*i + width/2 - (spacing*n/2), height/2);
    anim.add_point(point, angle);
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
  for (int i = 0; i<generations; i++){anim.update(); anim.display();}
  //spacing+=1;
  
  for (int i = 0; i<anim.angles.size(); i++) anim.angles.set(i, (anim.angles.get(i) + (radians(1)*pow(-1, i)))%360);

  stroke(255);
  anim.display();
  
  //anim.update();
  
}
void mouseClicked(){
  //click on the screen to pause the animation
  if (screen_is_paused) loop();
  else noLoop();  
  screen_is_paused = !screen_is_paused;
}

void keyPressed(){
  // press 's' to toggle slow motion
  // press 'p' to take a picture
  if (key == 's' || key == 'S'){
     if (screen_is_paused) return;
    if (in_slow_motion) frameRate(3);
    else frameRate(75);
    
    in_slow_motion = !in_slow_motion;
    return;
  }
  
  
  if (key == 'p' || key == 'P'){
    // press the p key to take a picture
    saveFrame("output/cool_picture####.png"); // all pictures are saved under the output folder
    println("Took picture!"); 
  }
  
  
  
}
