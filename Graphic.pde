int FA_Roll = 2000;
int FA_Bend = 2000;
int F_X     = 200;
float temp_offset = 0;
PVector[] path = {};
PVector current;
PVector prev ;
PVector curr ;
float arcStart, arcEnd, oldAng, newAng;
PVector angles;
int rotDir;

void GUI() {
  input="";
  background(0);
  //println("=======================================================");
  drawPath();
  drawTurns();
  show=3;
}

void drawPath() {
  strokeWeight(3);
  stroke(64);
  for (int i = 1; i < path.length; i++) {
    PVector prev = path[i-1];
    PVector curr = path[i];
    //line(prev.x, prev.y, curr.x, curr.y);
    fill(0, 255, 0, 200);
  line(prev.x*5, prev.y*5, curr.x*5, curr.y*5);
  // print("(" + path[i].x + ", " + path[i].y + ")");
  }
  noStroke();
 // fill(0, 255, 0, 200);
 // ellipse(path[0].x, path[0].y, 10, 10);
 // fill(255, 0, 0, 200);
 // ellipse(path[path.length - 1].x, path[path.length - 1].y, 10, 10);
}
 int maxxx=0;
void drawTurns() {

  for (int i = 1; i < path.length ; i++) {
    maxxx = path.length - 1;
    angles = rotation(path[i-1], path[i], path[i+1]);
    oldAng = angles.x;
    newAng = angles.y;
    rotDir = (int) angles.z;
   
    if (rotDir > 0) {
      arcEnd = newAng;
      arcStart = oldAng;
    } else {
      arcEnd = oldAng;
      arcStart = newAng;
    }
    if (arcStart > arcEnd) arcEnd += TWO_PI;
    prev = path[i-1];
    curr = path[i];
      
   // line(prev.x*5, prev.y*5, curr.x*5, curr.y*5);
    // println("Id : "+i+"\tLength -> "+(sqrt(pow((curr.x-prev.x),2)+pow((curr.y-prev.y),2)))+"\tARoll > "+myArray[i][17]+"\tAbend > "+((arcEnd-arcStart)*rotDir)*(180/PI));
   //  input+="Id:"+i+"\t> L > "+(sqrt(pow((curr.x-prev.x),2)+pow((curr.y-prev.y),2)))+"\t  Abend > "+((arcEnd-arcStart)*rotDir)*(180/PI)+"\t  ARoll > "+myArray[i][17]+"\n";
     //=================================================================================================
  gcodex(i);
     //=================================================================================================
   //  arc(path[i].x, path[i].y, 10, 10, arcStart, arcEnd, PIE);
     
    strokeWeight(1);
    stroke(128, 128, 0);
    fill(255, 255, 200);
   // arc(path[i].x, path[i].y, 20, 20, arcStart, arcEnd, PIE);
    
    if(i==path.length-2){i++;
    //=================================================================================================
    // println("Id : "+i+"\tLength -> "+(sqrt(pow((curr.x-prev.x),2)+pow((curr.y-prev.y),2)))+"\tARoll > "+myArray[i][17]+"\tAbend > "+((arcEnd-arcStart)*rotDir)*(180/PI));
    // input+="Id:"+i+"\t> L > "+(sqrt(pow((curr.x-prev.x),2)+pow((curr.y-prev.y),2)))+"\t  Abend > "+((arcEnd-arcStart)*rotDir)*(180/PI)+"\t  ARoll > "+myArray[i][17]+"\n";
      
     //=================================================================================================
   }
  }
}
 
PVector rotation(PVector from, PVector at, PVector to) {
  PVector oldDir = PVector.sub(at, from);
  PVector newDir = PVector.sub(to, at);
  float oldAng = atan2(oldDir.y, oldDir.x);
  oldAng = oldAng < 0 ? oldAng + TWO_PI : oldAng;
  float newAng = atan2(newDir.y, newDir.x);
  newAng = newAng < 0 ? newAng + TWO_PI : newAng;
  int rotDir = sign(oldDir, newDir);
  return new PVector(oldAng, newAng, rotDir);
}
 
public int sign(PVector v0, PVector v1) {
  if (v0.y * v1.x < v0.x * v1.y)
    return 1;
  else
    return -1;
}
