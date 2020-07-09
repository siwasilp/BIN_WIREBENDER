PrintWriter output;
String G_code="";
String new_code="";
float io=0;
void Gcode(){
  int i=0;
   println();
   println("i\tR\tL\tA_Bend"); 
  for (i = 0; i <= maxxx; i++) {
 
  //println(i+"\t"+nf(Roll_set(myArray[i][17]),0,0) +"\t"+nf((xxzz[i+1][3]),0,0)+"\t"+Bend_set((xxzz[i][1]))); 
  println(i+"\t"+nf((xxzz[i][5]),0,2)+"\t"+nf((xxzz[i+1][3]),0,2)+"\t"+nf(xxzz[i][1],0,2)); 
  //---------------------------------------------------------------------------------------------------------------------------------
  xxyy[i][1]=(xxzz[i][5]);
  xxyy[i][2]=(xxzz[i+1][3]);
  xxyy[i][3]=(xxzz[i][1]);
   
}
   
   
   println("###############CLEAN_UP#################"); 
   println("i\tR\tL\tB\tX"); 
   input="";
  for (i = 0; i <= maxxx; i++) {
  println(i+"\t"+nf((xxyy[i][1]),0,2)+"\t"+nf((xxyy[i][2]),0,2)+"\t"+nf(xxyy[i][3],0,2)+"\t"+nf(xxyy[i][4],0,2)); 
  
  new_code+="G90 A"+Roll_set(xxyy[i][1])+" F2000\n";                   //L1
  new_code+="G91 X"+nf((xxyy[i][2]),0,0)+" F2000\n";                   //L2
  new_code+="A0 F2000\n";                                              //L3

      if(xxyy[i][4]==1){
  input+="X___Id:"+i+"\t> L > "+(xxyy[i][2])+"\t  Abend > "+((xxyy[i][1]))+"\t  ARoll > "+(xxyy[i][3])+"\n";
  new_code+="G90 "+"A"+(Bend_set(xxyy[i][3]))+" F"+FA_Bend+"\n";       //L4
  new_code+="A0 F2000\n";                                                   //LY
  new_code+="G91 X1.8 F2000\n";                                             //LX
  }else{
  input+="O___Id:"+i+"\t> L > "+(xxyy[i][2])+"\t  Abend > "+((xxyy[i][1]))+"\t  ARoll > "+(xxyy[i][3])+"\n";
  }  
  
  new_code+="\n";   
}

  
  new_code+="G91 X5 F2000\n\n"; 
  println("=====================================");
  println(new_code);
  output.println(new_code);
  output.flush(); 
  output.close(); 
  show=4;
}
