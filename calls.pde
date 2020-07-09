int last=0;
 float RRR ;
  float ray[]={} ;
void call() {
  print("Id\tX\tY\tI\tJ\tR\tA_bend\ta\tb\tc\tl\tx\tDeg\tl'\tL\t#\tA_roll\n");
  for (int i = 0; i < cols; i++) {
     
    if (myArray[i][0] == 0 && myArray[i][1] == 0 && myArray[i][2] == 0 && myArray[i][3] == 0) {}
    else {
      print(i + "\t");
      maxxx=i;
      for (int j = 0; j < rows; j++) {

        myArray[i][4] = sqrt(pow((myArray[i][2]),2)+pow((myArray[i][3]),2)); // R
     
        myArray[i][6] = sqrt(pow((myArray[i+2][0]-myArray[i][0]),2)+pow((myArray[i+2][1]-myArray[i][1]),2));      // A
        myArray[i][7] = sqrt(pow((myArray[i+2][0]-myArray[i+1][0]),2)+pow((myArray[i+2][1]-myArray[i+1][1]),2));  // B
        myArray[i][8] = sqrt(pow((myArray[i+1][0]-myArray[i][0]),2)+pow((myArray[i+1][1]-myArray[i][1]),2));      // C
        float aaa = myArray[i][6];
        float bbb = myArray[i][7];
        float ccc = myArray[i][8];
        myArray[i][5] = acos((pow((bbb),2)+pow((ccc),2)-pow((aaa),2))/(2*bbb*ccc))*(180/PI);                      // A_Bend
        myArray[i][9] = myArray[i][8];         // l  
        float lll = myArray[i][9];
         RRR = myArray[i][4];
        float xxxx = myArray[i][0];
        float yyyy = myArray[i][1];
        
        myArray[i][10]= sqrt(abs(pow(abs(lll/2),2)-pow(abs(RRR),2)));        // x : SQRT(ABS(l/2)^2-(R)^2)
        float xxxxx = myArray[i][10];
        myArray[i][11]=((atan((lll/2)/xxxxx))*(180/PI))*2;
        float deg = myArray[i][11];
        myArray[i][12]=2*PI*RRR*(deg/360);
        float lp =  myArray[i][12];
       
        if(RRR==0)myArray[i][13]=ccc;
        else myArray[i][13]=2*PI*RRR*(deg/360);
        
        //================================================================================================
        myArray[i][14] = abs((myArray[i+2][0]-(myArray[i][0]))/2+myArray[i][0+2]);
        float Xc = myArray[i][14];
        myArray[i][15] = abs(((myArray[i+2][1]-(myArray[i][1]))/2+(myArray[i+2][1]-myArray[i][1])/2)+myArray[i+2][1]);
        float Yc = myArray[i][15];
        //================================================================================================
        
        
         
  
        //+++++++++++++++++++++++++++ No_Comple +++++++++++++++++++++++++++
        if(myArray[i][1]<Yc&&myArray[i][0]<Xc&&myArray[i+2][1]>myArray[i][1]) myArray[i][16] = 0;
        if(myArray[i][1]<Yc&&myArray[i][0]>Xc&&myArray[i+2][1]<myArray[i][1]) myArray[i][16] = 0;
        if(myArray[i][1]<Yc&&myArray[i][0]<Xc&&myArray[i+2][1]<myArray[i][1]) myArray[i][16] = 1;
        if(myArray[i][1]<Yc)myArray[i][16] = 1;
        if(myArray[i][1]>Yc)myArray[i][16] = 0;
        
        //-------------------------------------------------------------------------------------------------
        myArray[i][17] = A_Roll((int)RRR);
        
        if(j==14||j==15){}
        else{
       
        print(nf(myArray[i][j], 0, 2));
         
        print("\t");
        }
        
      }
    //  input += "\n";
      println();
    path = (PVector[]) append(path, new PVector(myArray[i][0], myArray[i][1]));
    redraw();
   }
  }

}
