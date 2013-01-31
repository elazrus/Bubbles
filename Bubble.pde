class Bubble {
  PImage bubbleImage;
  
  float x, y;
  float r;
  
  float xSpeed, ySpeed;
  
  boolean free;
  
  public Bubble(PImage bubbleImage, float x, float y, float r) {
    this.bubbleImage = bubbleImage;
    
    this.x = x;
    this.y = y;
    this.r = r;
    
    xSpeed = random(-3, 3);
    ySpeed = random(-3, 3);
    
    free = false;
  }
  
  void update() {
    if (free) {
      x += xSpeed;
      y += ySpeed;
    }
  }
  
  void render() {
    imageMode(CENTER);
    image(bubbleImage, x, y, 2*r, 2*r);
  }
  
  boolean outOfScreen() {
    float rightEdge = x + r;
    float leftEdge = x - r;
    float upEdge = y - r;
    float downEdge = y + r;
    
    return (rightEdge < 0 || leftEdge > width || upEdge > height || downEdge < 0);
  }
}
