
class animation{
  FloatList angles;
  ArrayList<PVector> points;
  animation(){
    this.points = new ArrayList<PVector>();
    this.angles = new FloatList();
  }
  void add_point(PVector point, float angle){
    this.points.add(point);
    this.angles.append(angle);
  }
  
  void display(){
    int r = 5;
    for (int i = 0; i < this.points.size() - 1; i++){
      circle(this.points.get(i).x, this.points.get(i).y, r);
      line(this.points.get(i).x, this.points.get(i).y, this.points.get(i+1).x, this.points.get(i+1).y);
    }
    circle(this.points.get(this.points.size()-1).x, this.points.get(this.points.size()-1).y, r);
  }
  
  void update(){
    for (int i = 0; i < this.points.size() ; i++){
      println(i, (i+1)%(this.points.size()));
      this.points.set(i, rotate_around_pivot(this.points.get((i+1)%(this.points.size())), this.points.get(i), this.angles.get(i)));
    }
    
  }

}
