//ANIMATION CONFIGURATIONS
float tenprintAnimationSpeed = 0.003;
float rotateRate = 0.001;
float scaleOscillationRate = 0.005;


//SIZE CONFIGURATIONS
int TenPrintSize = 30;
float noiseScale = 0.01;


//VARIABLES
int xoff, yoff = 0;
float noiseOffset = 0;
float rotate = 0;
float scaleOscillationAngle = 0;
float scale = 0;


void setup(){
  size(900,900);
  noiseSeed(int(random(1000)));
  stroke(255);
  strokeWeight(TenPrintSize/10);
  colorMode(HSB);
}


void draw(){
  //Achor point to centre
  translate(width/2,height/2);
  //Scale
  scaleOscillationAngle += scaleOscillationRate;
  scale = map(sin(scaleOscillationAngle),-1,1,0.7,2);
  scale(scale);
  
  //Rotate
  rotate+=rotateRate;
  rotate(rotate);
  background(51);
  
  //ten print animation
  noiseOffset += tenprintAnimationSpeed;
  float noise;
  //draw 10 Print.
  for(yoff = -1*height; yoff<height; yoff+=TenPrintSize){
    for(xoff = -1*width; xoff<width; xoff+=TenPrintSize){
      noise = noise(xoff*noiseScale,yoff*noiseScale,noiseOffset);
      int hue = int(map(noise,0,1,70,300));
      stroke(hue,170,200);
      if(noise < 0.5){
        line(xoff,yoff,TenPrintSize+xoff,TenPrintSize+yoff);
      }else{
        line(xoff,TenPrintSize+yoff,TenPrintSize+xoff,yoff);
      }
    }
  }
}