import processing.sound.*;

//OOP Assignment - Holodeck
//DT228-2
//Ela Gough C15363316

SoundFile BootySwing;

Heart heart; //declares heart
Stars stars; //declares stars
StartScreen start_screen;
TrainingOrRelaxationScreen training_or_relaxation_screen;

boolean screen1 = true; //StartScreen
boolean screen2 = false; //TrainingOrRelaxationScreen
boolean screen_training = false;
boolean screen_relaxation = false;
boolean screen_back_start = false;

ArrayList<Stars> starList = new ArrayList<Stars>(); //array list for stars created so they are infinetly generated

void setup() {
  size(1000, 600);
  
  //setting font
  PFont monta;
  monta = createFont("Montalban Condensed Bold.otf",100);
  textFont(monta);
  
  heart = new Heart(); //initilases heart
  stars = new Stars(); //initilases stars
  start_screen = new StartScreen();
  training_or_relaxation_screen = new TrainingOrRelaxationScreen();
  
  BootySwing = new SoundFile(this, "Parov Stelar - Booty Swing.mp3");
  BootySwing.play();
}


void draw() {
  background(20);
  //background(255);
  translate(width/2, height/2); //translate (0,0) to centre of screen
  noStroke();
  
  //cleaner code in draw to call functions:
  callstars();
  callheart();
  
  if (screen1 == true) { 
    screen_back_start = false;
    start_screen.render();
  } 
  if (screen2 == true) {
    training_or_relaxation_screen.render();
  }
  if (screen_back_start == true)
  {
    start_screen.render();
  }
}


void mousePressed() {
  //start_screen
  if (start_screen.endOver == true) {
    System.exit(0);
  }
  if (start_screen.startOver == true) {
    screen_back_start = false;
    screen1 = false;
    screen2 = true;
  }
  
  //training_or_relaxation_screen
  if (training_or_relaxation_screen.trainingOver == true) {
    screen_back_start = false;
    screen1 = false;
    screen2 = false;
    screen_training = true;
  }
  if (training_or_relaxation_screen.relaxationOver == true) {
    screen_back_start = false;
    screen1 = false;
    screen2 = false;
    screen_relaxation = true;
  }
  if (training_or_relaxation_screen.backOver == true) {
    screen1 = true;
    screen2 = false;
    screen_back_start = true;
  }
 }//end mousePressed()