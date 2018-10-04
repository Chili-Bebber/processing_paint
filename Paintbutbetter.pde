float x1 = mouseX;
float y1 = mouseY;
float x2;
float y2;
float speed;

boolean down = false;

float smoothness = 2;

color B = color(0,0,255);
color R = color(255,0,0);
color G = color(0,255,0);
color C = color(0,0,0);
color Bl = color(0,0,0);
color W = color(255,255,255);
color Y = color(255, 221, 0);
color P = color(165, 30, 255); 
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
int weight = 5;
int yellowX = 20;
int yellowY = 530;
int purpleX = 60;
int purpleY = 530;

int weightpX = 280;
int weightpY = 520;
int weightmX = 280;
int weightmY = 560;

int prevX = 280;
int prevY = 440;

void setup()
{
  background(255,255,255);
  noStroke();
  size(1200,600);
  rectMode(CENTER);
  
  
}

void draw()
{ 
  speed = sqrt(sq(x2 - mouseX) + sq(y2 - mouseY));
  
  x1 = x1 - (x1-mouseX)/(smoothness+speed/25);
  y1 = y1 - (y1-mouseY)/(smoothness+speed/25);
  
  if(mousePressed)
  {
  if(down == false) {
    down = true;
    x1 = mouseX;
    y1 = mouseY;
    x2 = x1;
    y2 = y1;
  }
  if(C == W) {
    strokeWeight(weight + 20);
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
  
  if (mouseX > (weightpX - 15) && mouseX < (weightpX + 15) && mouseY > (weightpY - 15) && mouseY < (weightpY + 15)) {
  weight = weight + 1;
  if (weight > 55) {
    weight = 55;
  }
  }
  if (mouseX > (weightmX - 15) && mouseX < (weightmX + 15) && mouseY > (weightmY - 15) && mouseY < (weightmY + 15)) {
  fill(255,255,255);
  stroke(255,255,255);
  weight = weight - 1;
  if (weight < 1) {
    weight = 1;
  }
  
  }
  x2 = x2 - (x2 - x1);
  y2 = y2 - (y2 - y1);
  // x2 = x1;
  // y2 = y1;
  }
  strokeWeight(1);
  stroke(160,160,160);
  rect(0,600,650,400);
  
  fill(255,255,255);
  stroke(0,0,0,0);
  ellipse(prevX,prevY,weight+3,weight+3);
  stroke(160,160,160);
  fill(C);
  ellipse(prevX,prevY,weight,weight);
  
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
  
  fill(P);//purple
  rect(purpleX,purpleY,30,30);
  
  fill(255,255,255);
  rect(clearX,clearY,30,30);
  line(clearX - 10,clearY - 10, clearX +10, clearY + 10);
  line(clearX + 10,clearY - 10, clearX -10, clearY + 10);
  
  stroke(160,160,160);
  line(weightpX-15,weightpY,weightpX+15,weightpY);
  line(weightpX,weightpY-15,weightpX,weightpY+15);
  
  line(weightmX -15, weightmY, weightmX +15, weightmY);
  
}


void mousePressed() {

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
  if (mouseX > (purpleX - 15) && mouseX < (purpleX + 15) && mouseY > (purpleY - 15) && mouseY < (purpleY + 15)) {
  C = P;
  }

}

void mouseReleased()
{
  down = false;
}
