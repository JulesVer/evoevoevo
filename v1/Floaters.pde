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
    
    println("size "+ layerGens.get(1));    
    
    println("size randomness "+ layerGens.get(2)); 
    
    println("maxDpeth "+ layerGens.get(5));
    
    maxDepth = 1+layerGens.get(5)*5;
    
    shapeAmount = int(layerGens.get(0)/5)+1;
    shapePoints = new PVector[shapeAmount];
    shapeSizes = new float[shapeAmount];
  }
  
  void setCoordinatesAndSizes(){
     for(int i = 1; i < shapePoints.length; i++){
      
      float size = 15 + layerGens.get(1)*2 + 4*(random(layerGens.get(2)) - (layerGens.get(2)/2));
       
      float x = random(width-(size*4))+size*2;
      float y = random(height-(size*4))+size*2;
      float z = random(maxDepth);
      
      //while(!colliding){        
      //  x = linePoints[i-1].x + random(xRandomness) - (xRandomness/2);
      //  y = linePoints[i-1].y + random(yRandomness) - (yRandomness/2);
      //}
      
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
  
  boolean colliding(float x, float y){
    if(x < 0 || x > width){
      return false;
    }
    else if(y<0 || y > height){
      return false;
    }
    return true;
  }
  
  
}
