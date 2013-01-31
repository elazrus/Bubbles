class FlowerWand extends Wand {
  
  public FlowerWand(float x, float y, float r, float l, color c, PImage bubbleImage) {
    super(x, y, r, l, c, bubbleImage);
  }
  
  Bubble createBubble() {
    return new Bubble(bubbleImage, x, y, r + r/4);
  }
  
  void render() {
    if (bubble != null) bubble.render();
    
    noFill();
    stroke(c);
    strokeWeight(r/4);
    
    ellipseMode(CENTER);
    //ellipse(x, y, 2*r, 2*r);
    for(int i=0; i < 10; i++) {
      pushMatrix();
      translate(x, y);
      rotate(radians(i * 36));
      translate(-x, -y);
      arc(x, y-r, r/2, r/2, PI, TWO_PI, OPEN);
      //ellipse(x, y-r, r/2, r/2);
      popMatrix();
    }
    
    pushMatrix();
    noFill();
    stroke(c);
    strokeWeight(r/4);
    translate(x, y);
    rotate(radians(-45));
    translate(-x, -y);
    line(x-r, y, x-r-l, y);
    
    fill(c);
    noStroke();
    ellipseMode(CENTER);
    ellipse(x-r-l, y, r/2, r/2);
    popMatrix();
  }
}
