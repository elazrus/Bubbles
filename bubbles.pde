import oscP5.*;

OscP5 oscP5;
Face face;

PImage bg;

Wand wand;
Wand[] wands;
CircleWand circleWand;
FlowerWand flowerWand;
StarWand starWand;
int curWand;

ArrayList bubbles;

void setup() {
  size(640, 480);
  smooth();
  frameRate(30);
  
  oscP5 = new OscP5(this, 8338);
  face = new Face();
  
  bg = loadImage("sky.jpg");
  
  circleWand = new CircleWand(width/2, height/2, 20, 100, color(33, 45, 252), loadImage("bubble.png"));
  flowerWand = new FlowerWand(width/2, height/2, 20, 100, color(55, 188, 62), loadImage("bubble_flower.png"));
  starWand = new StarWand(width/2, height/2, 20, 100, color(245, 44, 44), loadImage("bubble_star.png"));
  
  wands = new Wand[3];
  wands[0] = circleWand;
  wands[1] = flowerWand;
  wands[2] = starWand;

  curWand = 0;
  wand = wands[curWand];
  
  bubbles = new ArrayList();
}

void draw() {
  background(bg);
  if (face.found > 0) {
    update();
  }
  render();
}

void update() {
  if (face.found > 0) {
    if (face.eyebrowLeft > 8 && face.eyebrowRight > 8) {
      curWand += 1;
      curWand %= 3;
    }
    
    wand = wands[curWand];
    
    wand.x = face.posePosition.x;
    wand.y = face.posePosition.y;
    
    if (wand.startedBlowing) {
      if (0 < face.mouthWidth && face.mouthWidth < 12 &&
          0 < face.mouthHeight && face.mouthHeight < 3) {
            if (wand.bubble != null) wand.bubble.r += 1;
      }
      else {
        wand.freeBubble(bubbles);
      }
    }
    else {
       if (0 < face.mouthWidth && face.mouthWidth < 12 &&
          0 < face.mouthHeight && face.mouthHeight < 3) {
            wand.startedBlowing = true;
      }
    }
  }
  
  for (int i=0; i < bubbles.size(); i++) {
    Bubble b = (Bubble)(bubbles.get(i));
    b.update();
    
    if (b.outOfScreen()) bubbles.remove(b);
  }
  
  wand.update();
}

void render() {
  for (int i=0; i < bubbles.size(); i++) {
    Bubble b = (Bubble)(bubbles.get(i));
    b.render();
  }
  
  wand.render();
}

// OSC CALLBACK FUNCTIONS

void oscEvent(OscMessage m) {
  face.parseOSC(m);
}
