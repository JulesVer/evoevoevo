
int genCount = 9;
int genVar = 26;
int layers = 3;
IntList[] gens = new IntList[layers]; 
VLine vline;

void setup(){
  size(1000, 1300);
  generateGens();
}


void draw(){
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
}

void mouseClicked(){
  
  vline.setCoordinates();
  vline.drawLine();
}



void keyPressed() {
  if ((key == 'R') || (key == 'r')) {
    generateGens();
  }
}
