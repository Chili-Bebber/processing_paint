float x1 = mouseX;
float y1 = mouseY;
float x2;
float y2;

int smoothness = 3;

color B = color(0,0,255);
color R = color(255,0,0);
color G = color(0,255,0);
color C = color(0,0,0);
color Bl = color(0,0,0);
color W = color(255,255,255);
color Y = color(255, 221, 0);
int greenX = 100;
int greenY = 570;
int redX = 20;
int redY = 570;
int blueX = 60;
int blueY = 570;
int clearX = 770;
int clearY = 570;
int blackX = 160;
int blackY = 570;
int whiteX = 200;
int whiteY = 570;
int weight = 5;
int yellowX = 20;
int yellowY = 530;
int weightX = 240;
int weightY = 570;

void setup()
{
  background(255,255,255);
  noStroke();
  size(800,600);
  rectMode(CENTER);
  
  
}

void draw()
{
  strokeWeight(1);
  stroke(160,160,160);
  fill(R);//red
  rect(redX, redY, 30, 30);
  
  fill(G);//green
  rect(greenX, greenY, 30, 30);
  
  fill(B);//blue
  rect(blueX, blueY, 30, 30);
  
  fill(Bl);//black
  rect(blackX, blackY, 30, 30);
  
  fill(W);//white
  rect(whiteX, whiteY, 30, 30);
  
  fill(Y);//yellow
  rect(yellowX, yellowY, 30, 30);
  
  stroke(255,255,255);
  fill(255,255,255);
  rect(clearX,clearY,30,30);
  stroke(160,160,160);
  line(clearX - 10,clearY - 10, clearX +10, clearY + 10);
  line(clearX + 10,clearY - 10, clearX -10, clearY + 10);
  
  x1 = x1 - (x1-mouseX)/smoothness;
  y1 = y1 - (y1-mouseY)/smoothness;
  
  
  if(mousePressed)
  {
  if(C == W) {
    strokeWeight(12);
    stroke(C);
    //line(mouseX, mouseY, pmouseX, pmouseY);
    line(x2,y2,x1,y1);
  }
  else {
  strokeWeight(weight);
  stroke(C);
  //line(mouseX, mouseY, pmouseX, pmouseY);
  line(x2,y2,x1,y1);
  }
  
  }
  x2 = x1;
  y2 = y1;
}


void mousePressed()
{
  if (mouseX > (redX - 15) && mouseX < (redX + 15) && mouseY > (redY - 15) && mouseY < (redY + 15)) {
    C = R;
  }
  if (mouseX > (blueX - 15) && mouseX < (blueX + 15) && mouseY > (blueY - 15) && mouseY < (blueY + 15)) {
    C = B;
  }
  if (mouseX > (greenX - 15) && mouseX < (greenX + 15) && mouseY > (greenY - 15) && mouseY < (greenY + 15)) {
    C = G;
  }
  if (mouseX > (clearX - 15) && mouseX < (clearX + 15) && mouseY > (clearY - 15) && mouseY < (clearY + 15)) {
    background(255,255,255);
  }
  if (mouseX > (blackX - 15) && mouseX < (blackX + 15) && mouseY > (blackY - 15) && mouseY < (blackY + 15)) {
    C = Bl;
  }
  if (mouseX > (whiteX - 15) && mouseX < (whiteX + 15) && mouseY > (whiteY - 15) && mouseY < (whiteY + 15)) {
  C = W;
  }
  if (mouseX > (yellowX - 15) && mouseX < (yellowX + 15) && mouseY > (yellowY - 15) && mouseY < (yellowY + 15)) {
  C = Y;
  }
}

void mouseReleased()
{

}