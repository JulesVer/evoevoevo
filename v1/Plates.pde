class Plates {

  
  IntList layerGens;
  int shapeAmount, genVar;
  float maxDepth;
  PVector[] shapePoints;
  PVector[] shapeSizes;
  PVector[] shapeRotations;
  
  Plates(IntList g, int genV){
    layerGens = g;
    genVar = genV;
    
    println("!!!!! Plates!!!!!");
    
    println("plateAmount "+ layerGens.get(0));
    println("shapeAmount "+ layerGens.get(0));
    println("sizeY "+ layerGens.get(1));      
    println("sizeX "+ layerGens.get(2));    
    
    println("size randomness "+ layerGens.get(3)); 
    
    println("X rotation"+ layerGens.get(4)); 
    println("Y rotation"+ layerGens.get(5)); 
    println("Z rotation"+ layerGens.get(6)); 
    
    println("maxDepth "+ layerGens.get(7));
    
    maxDepth = 1+layerGens.get(7)*5;
    
    shapeAmount = int(layerGens.get(0)/5)+1;
    shapePoints = new PVector[shapeAmount];
    shapeSizes = new PVector[shapeAmount];
    shapeRotations = new PVector[shapeAmount];
  }
  
  void reset(){    
    
    for(int i = 1; i < shapePoints.length; i++){
      
        float sizeX = layerGens.get(2)*8 + 4*(random(layerGens.get(3)) - (layerGens.get(3)/2));
        float sizeY = layerGens.get(2)*8 + 4*(random(layerGens.get(3)) - (layerGens.get(3)/2));
         
        float x = random(width/2)+width/4;
        float y = random(height/2)+height/4;
        float z = random(maxDepth);
        
        float xRotation = ((random(layerGens.get(4)*2) + 1) / genVar) - 1;
        float yRotation = ((random(layerGens.get(5)*2) + 1) / genVar) - 1;
        float zRotation = ((random(layerGens.get(6)*2) + 1) / genVar) - 1;
        
        shapePoints[i] = new PVector(x, y, z);
        shapeSizes[i] = new PVector(sizeX, sizeY);
        shapeRotations[i] = new PVector(xRotation, yRotation, zRotation);
        
        println(xRotation + " y "+ yRotation + " z " + zRotation);
    }
  }
  
  void drawPlates(){
      
    for(int i = 1; i < shapePoints.length; i++){
       pushMatrix();
       noStroke();
       fill(255);      
       lights();
       translate(shapePoints[i].x,shapePoints[i].y, shapePoints[i].z);
       rotateX(shapeRotations[i].x);
       rotateY(shapeRotations[i].y);
       rotateZ(shapeRotations[i].z);
       box(shapeSizes[i].x, shapeSizes[i].y, .1);
       popMatrix();
    }
  }
  
  
}
