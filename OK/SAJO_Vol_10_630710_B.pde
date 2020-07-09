import java.io.File;
int index = 0;
// current text 
String input = "";

// file name as String
String currentFile = ""; 

// cursor sign blinks 
boolean cursorBlinkFlag;  // on/off 
int timerCursorBlink;     // timer 

//---------------------------------------------------------------------------

void setup() {
  size(800, 600);
     Load_data();
     Load_inf();
        load();
}
int show = 0;
void draw() {
  
if(show==0){
    background(0);
  text ("Command : F2 - Open_File => F3 - Review_Data => F4 to save a new file => F5 to Quit.", 10, 30 );
  text ("current file : " 
    + textOfCurrentFile(), 10, 50);

 text (input + strBlink(), 10, 70);
  output = createWriter(currentFile+".Gcode"); 
  
  
}
 if(show==1){GUI(); text (input + strBlink(), 400, 30); text (g, 10, 20);show=1;delay(100);}
 if(show==3){Gcode(); text (input + strBlink(), 400, 30);}
 

}

//---------------------------------------------------------------------------
// Inputs 
int g=1;
void keyPressed() {
  // Is the key CODED? 
    if(key=='a'){g--; if(g<=0)g=0;ellipse(path[g].x*5, path[g].y*5, 10, 10);}
    if(key=='d'){g++; if(g>maxxx)g=maxxx; ellipse(path[g].x*5, path[g].y*5, 10, 10);}
    if(key=='s'){ xxyy[g-1][4]=1 ; fill( 255, 0, 0); ellipse(path[g].x*5, path[g].y*5, 10, 10); }
    if(key==' '){;ellipse(path[g].x*5, path[g].y*5, 10, 10);}
    if(key=='z'){show=3;}
  if(key==ESC){
   input = "";
      currentFile = "";
      exit();
    }
  if (key==CODED) {
    // key is CODED --------------------------------------------
    if ( keyCode == java.awt.event.KeyEvent.VK_F2 ) {
      // open 
      load();
      show=0;
    } else if ( keyCode == java.awt.event.KeyEvent.VK_F3  ) {
      input = "";
      input +="===============================================\n";
      sprit();
      index=0;
      show=0;
    } else if ( keyCode == java.awt.event.KeyEvent.VK_F4  ) {
      println("CALs >> ==========================================================================================================================================");
      input = "";
      call();
      show=1;
    }
    else if ( keyCode == java.awt.event.KeyEvent.VK_F5  ) {
      // delete
      input = "";
      currentFile = "";
      exit();
    } else if ( keyCode == java.awt.event.KeyEvent.VK_F12  ) {
      // save new File 
      save();
    } else 
    {
      // do nothing
    }
    //
  } // if --------------------------------------------
  else  
  { // key is not CODED --------------------------------------------
    if (key==BACKSPACE) {
      // shorten
      if (input.length()>0)
        input=input.substring(0, input.length()-1);
    } else if (key==ESC) {
      // kill Esc
      key=0;
    } else {
      // add key (normal writing) 
      input+=key;
    } // else
    //
  } // else  // key is not CODED -----------------------------------------------
  //
} // func

// ------------------------------------------------------
// Load

void load() {
  File folderToStartFrom = new File( dataPath("") + "//*.*" ); 
  selectInput("Select a file to open", "fileSelectedOpen", folderToStartFrom );
  
}

void fileSelectedOpen(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    currentFile=selection.getAbsolutePath();
    input = join ( loadStrings( selection.getAbsolutePath() ), "\n" );
   
   delay(500);
      input +="===============================================\n";
      sprit();
      index=0;
      delay(500);
         println("CALs >> ==========================================================================================================================================");
      input = "";
      call();
      show=1;
        // println("GCODE >> ========================================================================================================================================");
    }//else
}

// ---------------------------------------------------------
// Save As.... 

void save() {
  selectOutput("Select a file to write to:", "fileSelectedWrite");
}

void fileSelectedWrite(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    // Do we have a txt at the end? 
    if (selection.getName().length() < 4 || selection.getName().indexOf(".txt") != selection.getName().length()-4 ) {
      // problem missing ".txt"
      currentFile = selection.getAbsolutePath()+".txt"; // very rough approach...
    } else {
      currentFile = selection.getAbsolutePath();
    }//else 
    String[] lines = new String[0];  
    lines = append ( lines, input ); 
    // Writes the strings to a file, each on a separate line
    saveStrings( currentFile, lines);
  }
}
// ---------------------------------------------------------
// Save existing file

void saveExistingFileThatHasBeenChanged() {
  println("saveExistingFileThatHasBeenChanged");
  // Writes the strings to a file, each on a separate line (overwriting)
  String[] lines = new String[0];  
  lines = append ( lines, input ); 
  saveStrings( currentFile, lines );
}

// ---------------------------------------------------------
// Tools

String textOfCurrentFile() {
  if (currentFile.equals(""))
    return "<Not a file>"; 
  else {
    
  return currentFile;
  }
}

String strBlink() {
  // manage and show the Blinking Cursor |

  // timer to toggle the flag cursorBlinkFlag
  if (millis()-timerCursorBlink > 330) {
    cursorBlinkFlag  = !cursorBlinkFlag; // toggle
    timerCursorBlink = millis(); // set timer
  }//if

  // return the line "|" or nothing 
  if (cursorBlinkFlag) 
    return"|";
  else return"";
}//func 
