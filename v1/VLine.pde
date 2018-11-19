class VLine {

  
  IntList layerGens;
  int linePointsAmount;
  PVector[] linePoints;
  
  VLine(IntList g){
    layerGens = g;
    
    println(layerGens);
    println("!!!!! Vertex Line !!!!!");
    
    println("StrokeWeight "+ layerGens.get(0));
    
    println("x randomness "+ layerGens.get(1));    
    
    println("y randomness "+ layerGens.get(2)); 
    
    println("linepointsamount "+ layerGens.get(3));
    
    linePointsAmount = layerGens.get(3)*2+1;
    linePoints = new PVector[linePointsAmount];
    
    setCoordinates();
    drawLine();
  }
  
  void setCoordinates(){
    float xRandomness = width/4+layerGens.get(1)*(100/linePointsAmount);
    float yRandomness = height/4+layerGens.get(2)*(100/linePointsAmount);
    
    linePoints[0] = new PVector(random(width/2) + width/4, random(height/2) + height/4, 0);
    
    for(int i = 1; i < linePoints.length; i++){
      float x = linePoints[i-1].x + random(xRandomness) - (xRandomness/2);
      float y = linePoints[i-1].y + random(yRandomness) - (yRandomness/2);
      
      linePoints[i] = new PVector(x, y, 0);
    }
    
    float xCorrection = width/2 - linePoints[linePoints.length/2].x;
    float yCorrection = height/2 - linePoints[linePoints.length/2].y;  
    
    for(int i = 0; i < linePoints.length; i++){    
      linePoints[i].x += xCorrection;
      linePoints[i].y += yCorrection;
    }
  }
  
  
  void drawLine(){    
    background(180);
    
    noFill();
    stroke(255);
    strokeWeight(1+layerGens.get(0)/13);
    smooth();
    
    beginShape();  
    curveVertex(linePoints[0].x,linePoints[0].y);  
    for(int i = 0; i < linePoints.length; i++){
      curveVertex(linePoints[i].x,linePoints[i].y);
    }  
    curveVertex(linePoints[linePoints.length-1].x,linePoints[linePoints.length-1].y);    
    endShape();  
    
    fill(255,0,0);
    noStroke();
    for(int i = 0; i < linePoints.length; i++){
      ellipse(linePoints[i].x,linePoints[i].y, 5, 5);
    }    
  }
  
  
}
