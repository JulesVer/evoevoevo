class Floaters {

  
  IntList layerGens;
  String type;
  int shapeAmount;
  float maxDepth;
  PVector[] shapePoints;
  float[] shapeSizes;
  
  Floaters(IntList g){
    layerGens = g;
    
    println(layerGens);
    println("!!!!! Vertex Line !!!!!");
    
    println("shapeAmount "+ layerGens.get(0));
    
    println("Shape "+ layerGens.get(1));
    
    println("size "+ layerGens.get(2));    
    
    println("size randomness "+ layerGens.get(3)); 
    
    println("maxDepth "+ layerGens.get(5));
    
    maxDepth = 1+layerGens.get(5)*5;
    
    shapeAmount = int(layerGens.get(0)/5)+1;
    shapePoints = new PVector[shapeAmount];
    shapeSizes = new float[shapeAmount];
  }
  
  void reset(){
     for(int i = 1; i < shapePoints.length; i++){
      
      float size = 15 + layerGens.get(2)*2 + 4*(random(layerGens.get(3)) - (layerGens.get(3)/2));
       
      float x = random(width-(size*4))+size*2;
      float y = random(height-(size*4))+size*2;
      float z = random(maxDepth);
      while(colliding(i, x, y, z, size)){        
        x = random(width-(size*4))+size*2;
        y = random(height-(size*4))+size*2;
      }
      
      shapePoints[i] = new PVector(x, y, z);
      shapeSizes[i] = size;
      
    }
  }
  
  void drawFloaters(){
     for(int i = 1; i < shapePoints.length; i++){
       pushMatrix();
       noStroke();
       fill(255);      
       lights();
       translate(shapePoints[i].x, shapePoints[i].y, shapePoints[i].z);
       sphereDetail(layerGens.get(1)*10 + 50);
       sphere(shapeSizes[i]);
       popMatrix();
     }
  
  }
  
  boolean colliding(int currentIndex, float x, float y, float z, float size){
    for(int i = 1; i < currentIndex; i++){
      float dist = dist(x, y, z, shapePoints[i].x,shapePoints[i].y,shapePoints[i].z);
      println("------"+currentIndex+" with "+i);
      println("dist"+dist);
      println("size"+(size + shapeSizes[i]));
      if(dist < (size + shapeSizes[i])){
        return true;
      }
    }   
    return false;
  }
  
  
}
