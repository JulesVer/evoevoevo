
int genCount = 9;
int genVar = 26;
int layers = 3;
IntList[] gens = new IntList[layers]; 
VLine vline;
Floaters floaters;

void setup(){
  size(1000, 1300, P3D);
  generateGens();
}


void draw(){
    background(180);
   vline.drawLine();
    floaters.drawFloaters();
}

void generateGens(){
  
  
  for(int j=0; j < layers; j++){  
    
    gens[j] = new IntList();

    for(int i = 0; i < genCount; i++){
      
      gens[j].append(int(random(genVar)));
      
    }  
    
  }
  
  println(gens);
  
  vline = new VLine(gens[0]);
  floaters = new Floaters(gens[1]);
  
  floaters.setCoordinatesAndSizes();  
  vline.setCoordinates();
}

void mouseClicked(){
  
  vline.setCoordinates();
  
  floaters.setCoordinatesAndSizes();
}



void keyPressed() {
  if ((key == 'R') || (key == 'r')) {
    generateGens();
  }
}
