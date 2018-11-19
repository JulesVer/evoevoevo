class VLine {

  
  IntList layerGens;
  
  VLine(IntList g){
    layerGens = g;
    
    println(layerGens);
    
    setCoordinates();
    drawLine();
  }
  
  void setCoordinates(){
    float xRandomness = width/5;
    float yRandomness = height/5;
    
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
