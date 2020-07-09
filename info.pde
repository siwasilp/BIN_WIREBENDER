void Load_inf(){
String[] lines = loadStrings("/info/Gcode.txt");
println("=========== Load INFO Gcode Line > " + lines.length + "");
for (int i = 0 ; i < lines.length; i++) {
  println(lines[i]);
}
println();
}
