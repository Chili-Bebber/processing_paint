//positions for line drawing
float x1 = mouseX;
float y1 = mouseY;
float x2;
float y2;
float speed;
float cw;

//positions for circle tool
float cx1;
float cy1;
float cx2;
float cy2;
float ccx;
float ccy;

//booleans for determining the stage of the circle tool
boolean circle1 = false;
boolean circle2 = false;
boolean circle1a = false;
boolean circle2a = false;
boolean circlefinished = false;
boolean circledone = false;

//whether or not the rainbow brush tool is on
boolean rainbow = false;

//whether or not the "pen" is "down" on the "paper"
boolean down = false;

//smoothness of line (how much the line lags behind the cursor for the purpose of making smoother curves)
int smoothness = 1;
//line weight variable
int weight = 5;

//Colour Variables
color B = color(0,0,255); 
color R = color(255,0,0);
color G = color(0,255,0);
color C = color(0,0,0);
color Bl = color(0,0,0);
color W = color(255,255,255);
color Y = color(255, 221, 0);
color P = color(122, 66, 255);
color O = color(211,70,13);
color Cy = color(8, 195, 224);
color Pk = color(224, 7, 148);
color Dg = color(12, 91, 16);
color Br = color(89, 29, 6);
color T = color(99, 95, 89);
color Rb;

//Coloured Box Loaction Variables
int greenX = 100; 
int greenY = 570;
int redX = 20;
int redY = 570;
int blueX = 60;
int blueY = 570;
int clearX = 1170;
int clearY = 570;
int blackX = 160;
int blackY = 570;
int whiteX = 200;
int whiteY = 570;
int yellowX = 20;
int yellowY = 530;
int purpleX = 60;
int purpleY = 530;
int rainbowX = 100;
int rainbowY = 530;
int orangeX = 20;
int orangeY = 490;
int cyanX = 60;
int cyanY = 490;
int pinkX = 100;
int pinkY = 490;
int dgreenX = 20;
int dgreenY = 450;
int brownX = 60;
int brownY = 450;
int taupeX = 100;
int taupeY = 450;

int circleX = 160; //For Circle Button
int circleY = 450;

 //For strokeWeight Changes Later

int quitX = 1170; //For Quit Button
int quitY = 30;

int weightpX = 280; //For strokeWeight changer
int weightpY = 530;
int weightmX = 280;
int weightmY = 570;

int smoothmX = 160; //For Smoothness Changer
int smoothmY = 530;
int smoothpX = 200;
int smoothpY = 530;

int textX = 135; // For Position of Smoothness Meter
int textY = 500;
int sIndicX = 176;
int sIndicY = 515;
int parabX = 180;
int parabY = 510;

int prevX = 280; //Brush preview
int prevY = 470;

//previous weight storage variable
int pweight = weight;

PFont F; //Font Setup

void setup()
{
  background(255,255,255);
  noStroke();
  size(1200,600);
  rectMode(CENTER);
  F = createFont("Arial", 16, true);
  
}

void draw()
{ 
  
  //firgure out state of circle tool (which of the 2 mouse clicks we're on)
  if (circle1a == true) {
    circle1 = true;
    circle1a = false;
  }
  if (circle2a == true) {
    circle2 = true;
    circle2a = false;
  }
  
  //figure out the coordinates and length/width of circle
  ccx = (cx1 + cx2)/2;
  ccy = (cy1 + cy2)/2;
  cw = sqrt( sq(cx1-cx2) + sq(cy1-cy2));
  //Figure out the rainbow brush's colour
  Rb = color(255-mouseX+60+speed,255-mouseY+20+speed,255-speed+60);
  //distance the mouse travelled per frame i.e. speed
  speed = sqrt(sq(x2 - mouseX) + sq(y2 - mouseY));
  //incrementing the first point of the line to be drawn this frame by a lower amount the higher the speed is
  x1 = x1 - (x1-mouseX)/(smoothness+speed/25);
  y1 = y1 - (y1-mouseY)/(smoothness+speed/25);
  
  if(mousePressed) //The Actual Drawing Part
  {
  if(down == false) {
    down = true;
    //draw a line between our 2 points that trail behind the mouse
    x1 = mouseX;
    y1 = mouseY;
    x2 = x1;
    y2 = y1;
  }

  else { //The Rainbow Brush
    if (rainbow ==true) {
      strokeWeight(weight);
      stroke(Rb);
      line(x2,y2,x1,y1);
    }
    else { //Standard Drawing Mode
      strokeWeight(weight);
      stroke(C);
      line(x2,y2,x1,y1);
    }
      
  }
  //more circle tool housekeeping
  if (circledone == true) {
    weight = pweight;
    circledone = false;
  }
  //drawing the circle from the circle tool
  if (circlefinished == true) {  
    fill(C);
    ellipse(ccx,ccy,cw,cw);
    fill(255,255,255);
    circlefinished = false;
    circledone = true;
  }

  //strokeWright Changer (Increasing)
  if (mouseX > (weightpX - 15) && mouseX < (weightpX + 15) && mouseY > (weightpY - 15) && mouseY < (weightpY + 15)) {
  weight = weight + 1;
  if (weight > 55) {
    weight = 55;
  }
  }  //strokeWright Changer (deeasing)
  if (mouseX > (weightmX - 15) && mouseX < (weightmX + 15) && mouseY > (weightmY - 15) && mouseY < (weightmY + 15)) {
  fill(255,255,255);
  stroke(255,255,255);
  weight = weight - 1;
  if (weight < 1) {
    weight = 1;
  }
  
  }
  //make the second point for the line drawn follow behind the first
  x2 = x2 - (x2 - x1);
  y2 = y2 - (y2 - y1);
  }
  strokeWeight(1); //Box that Contains Everything
  stroke(160,160,160);
  rect(0,620,650,400);
  
  stroke(0,0,0); //Smoothness Indicator
  ellipse(parabX,parabY,30,smoothness+10);
  stroke(0,0,0,0);
  rect(parabX,parabY+50,200,100);
  
  if (rainbow == true) {
    fill(Rb);
  }
  else {
    fill (C);
  }
  
  fill(0,0,0);
  //label to show current line smoothness
  text(smoothness, sIndicX, sIndicY); 
  
  if (rainbow ==true) {
    fill(Rb);
  }
  else {
    fill(C);
  }
  //Preview for brush showing colour and weight
  ellipse(prevX,prevY,weight,weight);
  
  //here's where we draw most of the UI elements
  stroke(160,160,160); 
 
  fill(R);//Red
  rect(redX, redY, 30, 30);
  
  fill(G);//Green
  rect(greenX, greenY, 30, 30);
  
  fill(B);//Blue
  rect(blueX, blueY, 30, 30);
  
  fill(Bl);//Black
  rect(blackX, blackY, 30, 30);
  
  fill(W);//White
  rect(whiteX, whiteY, 30, 30);
  
  fill(Y);//Yellow
  rect(yellowX, yellowY, 30, 30);
  
  fill(P);//Purple
  rect(purpleX,purpleY,30,30);
  
  fill(Rb);//Rainbow
  rect(rainbowX,rainbowY,30,30);
  
  fill(O);//Orange
  rect(orangeX,orangeY,30,30);
  
  fill(Cy); //Cyan
  rect(cyanX,cyanY,30,30);
  
  fill(Pk); //Pink
  rect(pinkX,pinkY,30,30);
  
  fill(Dg); //Dark Green
  rect(dgreenX,dgreenY,30,30);
  
  fill(Br); //Brown
  rect(brownX,brownY,30,30);
  
  fill(T); //Taupe
  rect(taupeX,taupeY,30,30);
  
  fill(255); //Circle Tool
  ellipse(circleX,circleY,30,30);
  
  fill(255,255,255); //Clear Button
  rect(clearX,clearY,30,30);
  line(clearX - 10,clearY - 10, clearX +10, clearY + 10);
  line(clearX + 10,clearY - 10, clearX -10, clearY + 10);
  
  stroke(255,0,0); //Quit button
  rect(quitX, quitY,30,30);
  line(quitX - 10,quitY - 10, quitX +10, quitY + 10);
  line(quitX + 10,quitY - 10, quitX -10, quitY + 10);
  
  stroke(160,160,160); //Weight changer maker (+)
  line(weightpX-15,weightpY,weightpX+15,weightpY);
  line(weightpX,weightpY-15,weightpX,weightpY+15);
  
  line(weightmX -15, weightmY, weightmX +15, weightmY);
  
  stroke(50,50,50); //Weight changer maker (-)
  line(smoothmX-15,smoothmY,smoothmX+15,smoothmY);
  line(smoothmX,smoothmY-15,smoothmX,smoothmY+15);
  line(smoothpX -15, smoothpY, smoothpX +15, smoothpY);
  
}

void mousePressed() {
  //if statements to figure out if the user has clicked on any of our very beatiful and appealing buttons

  if (mouseX > (redX - 15) && mouseX < (redX + 15) && mouseY > (redY - 15) && mouseY < (redY + 15)) {
    C = R;
    rainbow = false;
  }
  if (mouseX > (blueX - 15) && mouseX < (blueX + 15) && mouseY > (blueY - 15) && mouseY < (blueY + 15)) {
    C = B;
    rainbow = false;
  }
  if (mouseX > (greenX - 15) && mouseX < (greenX + 15) && mouseY > (greenY - 15) && mouseY < (greenY + 15)) {
    C = G;
    rainbow = false;
  }
  if (mouseX > (clearX - 15) && mouseX < (clearX + 15) && mouseY > (clearY - 15) && mouseY < (clearY + 15)) {
    background(255,255,255);
  }
  if (mouseX > (blackX - 15) && mouseX < (blackX + 15) && mouseY > (blackY - 15) && mouseY < (blackY + 15)) {
    C = Bl;
    rainbow = false;
  }
  if (mouseX > (whiteX - 15) && mouseX < (whiteX + 15) && mouseY > (whiteY - 15) && mouseY < (whiteY + 15)) {
  C = W;
  rainbow = false;
  }
  if (mouseX > (yellowX - 15) && mouseX < (yellowX + 15) && mouseY > (yellowY - 15) && mouseY < (yellowY + 15)) {
  C = Y;
  rainbow = false;
  }
  if (mouseX > (purpleX - 15) && mouseX < (purpleX + 15) && mouseY > (purpleY - 15) && mouseY < (purpleY + 15)) {
  C = P;
  rainbow = false;
  }
  if (mouseX > (rainbowX - 15) && mouseX < (rainbowX + 15) && mouseY > (rainbowY - 15) && mouseY < (rainbowY + 15)) {
  rainbow = true;
  }
  if (mouseX > (orangeX - 15) && mouseX < (orangeX + 15) && mouseY > (orangeY - 15) && mouseY < (orangeY + 15)) {
  C = O;
  rainbow = false;
  }
  if (mouseX > (cyanX - 15) && mouseX < (cyanX + 15) && mouseY > (cyanY - 15) && mouseY < (cyanY + 15)) {
  C = Cy;
  rainbow = false;
  }
  if (mouseX > (pinkX - 15) && mouseX < (pinkX + 15) && mouseY > (pinkY - 15) && mouseY < (pinkY + 15)) {
  C = Pk;
  rainbow = false;
  }
  if (mouseX > (dgreenX - 15) && mouseX < (dgreenX + 15) && mouseY > (dgreenY - 15) && mouseY < (dgreenY + 15)) {
  C = Dg;
  rainbow = false;
  }
  if (mouseX > (brownX - 15) && mouseX < (brownX + 15) && mouseY > (brownY - 15) && mouseY < (brownY + 15)) {
  C = Br;
  rainbow = false;
  }
  if (mouseX > (taupeX - 15) && mouseX < (taupeX + 15) && mouseY > (taupeY - 15) && mouseY < (taupeY + 15)) {
  C = T;
  rainbow = false;
  }
  if (mouseX > (circleX - 15) && mouseX < (circleX + 15) && mouseY > (circleY - 15) && mouseY < (circleY + 15)) {
  circle1a = true;
  rainbow = false;
  pweight = weight;
  weight = 0;
  }
  
  //advance the state of the circle tool and figure out the coordiantes of the 2 points we will use to draw
  if(circle1 == true) { 
    cx1 = mouseX;
    cy1 = mouseY;
    circle2a = true;
    circle1 = false;
  }
  if(circle2 == true) {
    cx2 = mouseX;
    cy2 = mouseY;
    circle2 = false;
    circlefinished = true;
    
  }

  //smoothness buttons
  if (mouseX > (smoothmX - 15) && mouseX < (smoothmX + 15) && mouseY > (smoothmY - 15) && mouseY < (smoothmY + 15)) {
     smoothness = (smoothness + 1);
     if (smoothness > 40) {
       smoothness = 40;
     }
  }
  if (mouseX > (smoothpX - 15) && mouseX < (smoothpX + 15) && mouseY > (smoothpY - 15) && mouseY < (smoothpY + 15) && (smoothness != 0)) {
  smoothness = (smoothness - 1);
  if (smoothness < 1) {
    smoothness = 1;
  }
  }
  //quit button.
  if (mouseX > (quitX - 15) && mouseX < (quitX + 15) && mouseY > (quitY - 15) && mouseY < (quitY + 15)) {
  exit();
  }
}

void mouseReleased()
{
  down = false;
}
void keyPressed()
{
  save("exported.png");
}

