float[][] xxzz = new float[50][6];
float[][] xxyy = new float[50][6];
void gcodex(int i){
  
  xxzz[i][0]=(myArray[1][17]);
  xxzz[i+1][3]=myArray[1][3]; 
  xxzz[i+1][2]=(myArray[1][17]);
  xxzz[i+1][1]=xxzz[1][1];
  xxzz[i+1][4]=(myArray[1][5]);
  
  xxzz[i-1][0]=(myArray[i][17]);
  xxzz[i-1][1]=((((((arcEnd-arcStart)*rotDir)*(180/PI)))));
  xxzz[i][2]=(myArray[i][17]);
  xxzz[i][3]=myArray[i][13]; //(sqrt(pow((curr.x-prev.x),2)+pow((curr.y-prev.y),2)));
  xxzz[i][4]=(myArray[i][5]);
  
  xxzz[i][5]=(myArray[i+1][4]);
  xxzz[i+1][5]=(myArray[i+2][4]);
   //println("Id : "+i+"\n");
    // println("G90 "+"A"+Roll_set(myArray[i][17])+" F"+FA_Roll);
     G_code+="G90 "+"A"+Roll_set(myArray[i][17])+" F"+FA_Roll+"\n";
   
     if((myArray[i][4])==0){
    // println("G91 "+"X"+((sqrt(pow((curr.x-prev.x),2)+pow((curr.y-prev.y),2)))-temp_offset)+" F"+F_X);
     G_code+="G91 "+"X"+((sqrt(pow((curr.x-prev.x),2)+pow((curr.y-prev.y),2)))-temp_offset)+" F"+F_X+"\n";
     temp_offset = 0;
     }else{  
    // println("G91 "+"X"+(sqrt(pow((curr.x-prev.x),2)+pow((curr.y-prev.y),2)))+" F"+F_X);    
      G_code+="G91 "+"X"+((sqrt(pow((curr.x-prev.x),2)+pow((curr.y-prev.y),2)))-temp_offset)+" F"+F_X+"\n";
     temp_offset = 0;
     }
   
    // println("A0"+" F"+FA_Roll);
       G_code+="A0"+" F"+FA_Roll+"\n";
       
    // println("G90 "+"A"+(Bend_set((((arcEnd-arcStart)*rotDir)*(180/PI))))+" F"+FA_Bend);
       G_code+="G90 "+"A"+(Bend_set((((arcEnd-arcStart)*rotDir)*(180/PI))))+" F"+FA_Bend+"\n";
     
    // println("A0"+" F"+FA_Roll);
       G_code+="A0"+" F"+FA_Roll+"\n";
     //===================================================================================================
   
         
           if((Roll_set(myArray[i-1][4])>=40||Roll_set(myArray[i-1][4])<=-40)&&(Roll_set(myArray[i+1][17])>=40||Roll_set(myArray[i+1][17])<=-40)){
            
     //  println("G91 X1.8 F200\n");
       G_code+="G91 X1.8 F200"+"\n";
       temp_offset=1.8;
           }     
     //---------------------------------------------------------------------------------------------------
//     println();
     G_code+="\n";
     
}
