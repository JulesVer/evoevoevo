int linePointsAmount = 20;
int genCount = 6;
int genVar = 26;
int layers = 3;
IntList[] gens = new IntList[layers]; 
VLine vline;

PVector[] linePoints = new PVector[linePointsAmount];

void setup(){
  size(1000, 1300);
  
  for(int j=0; j < layers; j++){  
    
    gens[j] = new IntList();

    for(int i = 0; i < genCount; i++){
      
      gens[j].append(int(random(genVar)));
      
    }  
    
  }
  
  println(gens);
  
  vline = new VLine(gens[0]);
}


void draw(){
}

void mouseClicked(){
  
  vline.setCoordinates();
  vline.drawLine();
}
