//---------------------------------------
Table table_r;
int r_index = 0;
int Roll_run = 0;
int Bend_run = 0;
int [] A_Roll = new int[500];
//---------------------------------------

float Roll_set(float data_r){
  int Roll_Offset = 0; 
  int Angle_Roll  = 0;
for (TableRow row : table_r.rows()) {
    Angle_Roll    = row.getInt("Angle_Roll");
    Roll_Offset   = row.getInt("Roll_Offset");
    if((int)data_r==Angle_Roll){
    //println("  #R# " + data_r + "\t > "+Roll_Offset+" -> " );
    data_r=Roll_Offset;
    break;
    }
  }
  return data_r;
}

float Bend_set(float data_r){
  int Bend_Offset = 0; 
  int Angle_Bend  = 0;
for (TableRow row : table_r.rows()) {
    Angle_Bend    = row.getInt("Angle_Roll");
    Bend_Offset   = row.getInt("Bend_Offset");
     if((int)data_r==Angle_Bend){
      //print("  #B# " + data_r + "\t > "+Bend_Offset+" -> " );
   data_r= Bend_Offset; 
   }
  }
  return data_r;
}

void Load_data() {
    table_r = loadTable("/info/Data.csv", "header");
    r_index = table_r.getRowCount();
    
   println("Load Data : " + table_r.getRowCount() + " table");
   println("id\t(ARoll)\t>[Rset]<\t(ABend)\t>[Bset]<\t--> Asts" );
   println("======================================================" );
  for (TableRow row : table_r.rows()) {
    int id = row.getInt("id");
    int Angle_Roll    = row.getInt("Angle_Bend");
    int Roll_Offset   = row.getInt("Bend_Offset");
    int Angle_Bend    = row.getInt("Angle_Roll");
    int Bend_Offset   = row.getInt("Roll_Offset");
    println(id+"\t("+ Angle_Roll + ")"+"\t["+Roll_Offset +"]"+"\t("+ Angle_Bend + ")"+"\t["+Bend_Offset +"]\t->> ok!!" );
  }
  println();
}
