class VLine {

  
  IntList layerGens;
  int linePointsAmount;
  float maxDepth;
  PVector[] linePoints;
  
  VLine(IntList g){
    layerGens = g;
    
    println(layerGens);
    println("!!!!! Vertex Line !!!!!");
    
    println("StrokeWeight "+ layerGens.get(0));
    
    println("x randomness "+ layerGens.get(1));    
    
    println("y randomness "+ layerGens.get(2)); 
    
    println("z randomness "+ layerGens.get(3)); 
    
    println("linepointsamount "+ layerGens.get(4));
    
    println("maxDpeth "+ layerGens.get(5));
    
    linePointsAmount = layerGens.get(4)*2+1;
    linePoints = new PVector[linePointsAmount];
    
    maxDepth = 1+layerGens.get(5)*10;
    
    setCoordinates();
    drawLine();
  }
  
  void setCoordinates(){
    float xRandomness = width/4+layerGens.get(1)*(50/linePointsAmount);
    float yRandomness = height/4+layerGens.get(2)*(50/linePointsAmount);
    float zRandomness = maxDepth/4+layerGens.get(3)*(50/linePointsAmount);
    
    linePoints[0] = new PVector(random(width/2) + width/4, random(height/2) + height/4, random(maxDepth));
    
    for(int i = 1; i < linePoints.length; i++){
      float x = linePoints[i-1].x + random(xRandomness) - (xRandomness/2);
      float y = linePoints[i-1].y + random(yRandomness) - (yRandomness/2);
      float z = linePoints[i-1].z + random(zRandomness) - (zRandomness/2);
      
      while(!stayInFrame(x, y, z)){        
        x = linePoints[i-1].x + random(xRandomness) - (xRandomness/2);
        y = linePoints[i-1].y + random(yRandomness) - (yRandomness/2);
        z = linePoints[i-1].z + random(zRandomness) - (zRandomness/2);
      }
      
      linePoints[i] = new PVector(x, y, 0);
    }
    
    float xCorrection = width/2 - linePoints[linePoints.length/2].x;
    float yCorrection = height/2 - linePoints[linePoints.length/2].y;  
    float zCorrection = maxDepth/2 - linePoints[linePoints.length/2].z;  
    
    for(int i = 0; i < linePoints.length; i++){    
      linePoints[i].x += xCorrection;
      linePoints[i].y += yCorrection;
      linePoints[i].z += zCorrection;
    }
  }
  
  
  void drawLine(){      
    
    beginShape(); 
    noFill();
    stroke(255);
    smooth(); 
    
    strokeWeight(1);
    
    curveVertex(linePoints[0].x,linePoints[0].y,linePoints[0].z);  
    
    for(int i = 0; i < linePoints.length; i++){
      
      if(layerGens.get(0) > 18){
        strokeWeight(1+i*(layerGens.get(0)/18));
      }
      else if(layerGens.get(0) > 12){
        float distToCenter = abs(i - linePoints.length/2);
        strokeWeight(2+distToCenter);
      }
      else if(layerGens.get(0) > 6){
        float distFromCenter = abs(linePoints.length/2-i);
        strokeWeight(2+distFromCenter);        
      }
      else{
         strokeWeight(.5 + layerGens.get(0)/6);
      }      
        
      curveVertex(linePoints[i].x,linePoints[i].y,linePoints[i].z);
    }  
    curveVertex(linePoints[linePoints.length-1].x,linePoints[linePoints.length-1].y,linePoints[linePoints.length-1].z);    
    endShape();  
  }
  
  boolean stayInFrame(float x, float y, float z){
    if(x < 0 || x > width){
      return false;
    }
    else if(y<0 || y > height){
      return false;
    }
    else if(z<0 || z > maxDepth){
      return false;
    }
    return true;
  }
  
  
}
