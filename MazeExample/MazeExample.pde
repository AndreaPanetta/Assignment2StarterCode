int BLOCK_SIZE = 16;
int m_width = 23;
int m_height = 23;

//the start/end point of the maze
int startX = 9; int startY = 0;
int endX = 21; int endY = 22;

String file = "maze3.txt";

boolean[][] maze;
String[] mazeString;
boolean[][] stars;

//read file
String[] lines;
int starCounter = 9;

//font
PFont Eureka90;
PFont Consolas20;

//image
PImage user;
PImage ending;
PImage bg;
PImage star;

//for layout
int shiftX;
int shiftY;

void setup(){
  size(550, 550);
  noStroke();
  noLoop();

  maze = new boolean[m_height][m_width];
  mazeString = new String[m_height];
  stars = new boolean[m_height][m_width];//default value is false, no stars

  shiftX = (width-BLOCK_SIZE*m_width)/2 ;
  shiftY = (height-BLOCK_SIZE*m_height)/2 + 50;

  //initialization
  user = loadImage("user.png");
  ending = loadImage("cake.png"); 
  star = loadImage("star.png");
  bg = loadImage("bg.jpg");
  background(bg);

  //indtruction text    
  Consolas20 = loadFont("LucidaFax-13.vlw");
  textFont(Consolas20);
  fill(0, 0, 0);
  text("Instruction:\n1. Clicking on the maze to give it focus.\n2. Using \"UP, DOWN, RIGHT, LEFT\" to move.\n3. Eating up all stars.", shiftX, shiftY - 70);
  
  //"finish" font
  Eureka90 = loadFont("Eureka90.vlw");
  textFont(Eureka90, 70); 

  mazeString = loadStrings(file);// read maze structure from .txt file
  initial(); //set 2D-array based on mazeString

}

void draw(){

  //redraw the position of the user
  image(user, BLOCK_SIZE*startY + shiftX, BLOCK_SIZE*startX + shiftY);
  
    //get to the destination
    if((starCounter == 0) && (startX == endX) && (startY == endY)){
      fill(255, 0, 0);
      text("Finished!!", shiftX + 35, 320);
      exit(); // Stop the program
    }
}

void keyPressed() {
  int tempX = startX;
  int tempY = startY;
  
  if (key == CODED) {
    if(keyCode == UP){
      tempX -= 1;
    }
    else if (keyCode == DOWN) {
      tempX += 1;
    } 
    else if (keyCode == LEFT) {
      tempY -= 1;
    } 
    else if (keyCode == RIGHT) {
      tempY += 1;
    } 
  }
  
  if(isValid(tempX, tempY) && (!maze[tempX][tempY])){  
    pad(false, startX, startY); //color the user previous position as gray  
    startX = tempX;
    startY = tempY;
    redraw();
  }
}

void initial(){
//  set 2D-array based on mazeString
  /*   mazeString[0] = "1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1";  */

  for(int i = 0; i < mazeString.length; i++){
    String[] temp = splitTokens(mazeString[i]);
    for(int j = 0; j < temp.length; j++){
      int bit = int(temp[j]);
      if (bit == 1) {
        maze[i][j] = true;//wall
      }
      else{
        maze[i][j] = false;//available
      }
    }
  }
   build();
}

void build(){
  //according to 2D-array to build the image
  for(int i = 0; i < m_height; i++){
    for(int j = 0; j < m_width; j++){
      //color the blocks
      pad(maze[i][j], i, j);
    }
  }
  
  //place star
  placeStar();
  
  //end point
  image(ending, endY*BLOCK_SIZE + shiftX ,endX*BLOCK_SIZE + shiftY);
}

void pad(boolean b, int i, int j){
   
  if(b){
    fill(31, 56, 64); //wall
  }else{
    fill(215, 223, 226); //route
  }
  rect(j*BLOCK_SIZE + shiftX , i*BLOCK_SIZE + shiftY, BLOCK_SIZE, BLOCK_SIZE);
  
  //when meet the star
  if(stars[i][j]){
    starCounter --;
    stars[i][j] = false;
  }
  
  //place the end icon
  if((i == endX) && (j == endY)){
    image(ending, endY*BLOCK_SIZE + shiftX ,endX*BLOCK_SIZE + shiftY);
  }

}

boolean isValid(int x, int y){
  return (x >= 0) && (y >= 0) && (x < m_height) && (y < m_width);
}

void placeStar(){
  stars[5][9] = true;
  image(star, BLOCK_SIZE*9 + shiftX, BLOCK_SIZE*5 + shiftY);
  
  stars[15][13] = true;
  image(star, BLOCK_SIZE*13 + shiftX, BLOCK_SIZE*15 + shiftY);
  
  stars[21][18] = true;
  image(star, BLOCK_SIZE*18 + shiftX, BLOCK_SIZE*21 + shiftY);
  
  stars[3][9] = true;
  image(star, BLOCK_SIZE*9 + shiftX, BLOCK_SIZE*3 + shiftY);
  
  stars[5][16] = true;
  image(star, BLOCK_SIZE*16 + shiftX, BLOCK_SIZE*5 + shiftY);
  
  stars[9][17] = true;
  image(star, BLOCK_SIZE*17 + shiftX, BLOCK_SIZE*9 + shiftY);
  

  
  stars[17][18] = true;
  image(star, BLOCK_SIZE*18 + shiftX, BLOCK_SIZE*17 + shiftY);
  
  stars[11][19] = true;
  image(star, BLOCK_SIZE*19 + shiftX, BLOCK_SIZE*11 + shiftY);

  stars[13][17] = true;
  image(star, BLOCK_SIZE*17 + shiftX, BLOCK_SIZE*13 + shiftY);
}
