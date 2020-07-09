Ball balls[];
Data data[];
int max=0;
PVector[] pointArray = new PVector[999];
ArrayList balls_tmp = new ArrayList();
ArrayList data_temp = new ArrayList();

void sprit(){
  
  String lines[] = loadStrings(currentFile);
  max=lines.length;
  for(int i = 0; i < lines.length-1; i++){
    if (lines[i].startsWith("G00 X")){
      println("Begin...");
      String[] valuesx = split(lines[i],' ');  
       balls_tmp.add( new Ball(valuesx[0], valuesx[1], valuesx[2]) );
     }
     if (lines[i].startsWith("G01 X")){
     String[] valuesx = split(lines[i],' ');  
       balls_tmp.add( new Ball(valuesx[0], valuesx[1], valuesx[2] ));
     }
      if (lines[i].startsWith("G02 X")){
     String[] valuesx = split(lines[i],' ');  
       balls_tmp.add( new Ball(valuesx[0], valuesx[1], valuesx[2],valuesx[4], valuesx[5]));
     }
       if (lines[i].startsWith("G03 X")){
     String[] valuesx = split(lines[i],' ');  
       balls_tmp.add( new Ball(valuesx[0], valuesx[1], valuesx[2],valuesx[4], valuesx[5]));
     }
  }
   balls = new Ball[balls_tmp.size()];
   balls_tmp.toArray(balls);
   
   data = new Data[data_temp.size()];
   data_temp.toArray(data);
}

int cols = 500;
int rows = 18;

float[][] myArray = new float[cols][rows];
class Data{
    Data(float x, float y, float i, float j){
      
     myArray[index][0]=x;
     myArray[index][1]=y;
     myArray[index][2]=i;
     myArray[index][3]=j;
    }
}

class Ball{
  
  Ball(String g, String x, String y){
   println(  "N > "+index+",\t"+ g +", "+x+", "+y);
    input += index+"  ->  "+ g +", "+x+", "+y+"\n";
    index++;
    float a_x[] = float(split(x, 'X'));
    float a_y[] = float(split(y, "Y"));
    data_temp.add( new Data(a_x[1], a_y[1], 0,0));  
  }
  
  Ball(String g,String x, String y, String i, String j){
    println( "N > "+index+",\t"+ g +", "+x+", "+y+", "+i+", "+j);
    input += index+"  ->  "+ g +", "+x+", "+y+", "+i+", "+j+"\n";
     index++;   
      float a_x[] = float(split(x, 'X'));
    float a_y[] = float(split(y, "Y"));
     float a_i[] = float(split(i, 'I'));
    float a_j[] = float(split(j, "J"));
     data_temp.add( new Data(a_x[1], a_y[1],a_i[1], a_j[1])); 
  }
}
