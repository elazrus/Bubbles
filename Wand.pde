abstract class Wand {
  float x, y;
  float r;
  float l;
  color c;

  boolean startedBlowing;
  boolean blowing;
  
  PImage bubbleImage;
  Bubble bubble;
    
  public Wand(float x, float y, float r, float l, color c, PImage bubbleImage) {
    this.x = x;
    this.y = y;
    
    this.r = r;
    this.l = l;
    
    this.c = c;
    
    startedBlowing = false;
    blowing = false;
    
    this.bubbleImage = bubbleImage;
    bubble = createBubble();
  }
  
  abstract Bubble createBubble();
  
  void freeBubble(ArrayList bubbles) {
    if (bubble != null) {
      bubble.free = true;
      bubbles.add(bubble);
    }
    
    bubble = createBubble();
    
    startedBlowing = false;
    blowing = false;
  }
  
  void update() {
    if (bubble != null) {
      bubble.x = x;
      bubble.y = y;
    }
  }
  
  abstract void render();
}
