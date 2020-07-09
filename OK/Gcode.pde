//PrintWriter output;
//String G_code="";
//String new_code="";
//float io=0;
//void Gcode(){
//  int i=0;
  
//  for (i = 0; i <= maxxx; i++) {
//  if(i==0)io=xxzz[i+1][3];
//  if(i==maxxx)xxzz[i+1][3]=io; 
//  if(i==maxxx-1){}
//  else{
//  input+="Id:"+i+"\t> L > "+(xxzz[i+1][3])+"\t  Abend > "+Bend_set((xxzz[i][1]))+"\t  ARoll > "+nf(Roll_set(myArray[i][17]),0,0)+"\n";
//  println(i+"\t"+xxzz[i][0]+"\t"+Bend_set((xxzz[i][1]))+"\t"+nf((xxzz[i][2]),0,0)+"\t"+nf((xxzz[i][3]),0,0)+"\t"+nf((xxzz[i][4]),0,0)); 
  
//  new_code+="G90 A"+nf((myArray[i][17]),0,0)+" F2000\n";        //L1
//  new_code+="G91 X"+nf((xxzz[i+1][3]),0,0)+" F2000\n";          //L2
//  new_code+="A0 F2000\n";                                       //L3
//  //-------------------------------------------------------------
//  if((Bend_set(xxzz[i][1])>=40||Bend_set(xxzz[i][1])<=-40)&&(xxzz[i][2]>=40||xxzz[i][2]<=-40)){
//  new_code+="G90 "+"A"+(Bend_set((xxzz[i][1]))*-1)+" F"+FA_Bend+"\n";       //L4
//  new_code+="A0 F2000\n";                                                   //LY
//  new_code+="G91 X1.8 F2000\n";                                             //LX
//  }
//  else {
//  new_code+="G90 "+"A"+(Bend_set((xxzz[i][1]))*-1)+" F2000\n";              //L4    
//  }
//  new_code+="A0 F2000\n\n";                                                 //L5   
//  }
//  }
//  //-------------------------------------------------------------
 
//  new_code+="G91 X5 F2000\n\n"; 
//  println("=====================================");
//  println(new_code);
//  output.println(new_code);
//  output.flush(); 
//  output.close(); 
//  show=4;

//}
