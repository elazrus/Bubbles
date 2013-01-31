class StarWand extends Wand {
  
  public StarWand(float x, float y, float r, float l, color c, PImage bubbleImage) {
    super(x, y, r, l, c, bubbleImage);
  }
  
  Bubble createBubble() {
    return new Bubble(bubbleImage, x, y, r);
  }
  
  void render() {
    if (bubble != null) bubble.render();
    
    noFill();
    stroke(c);
    strokeWeight(r/4);
      
    pushMatrix();
    translate(x, y);
    rotate(radians(45));
    translate(-x, -y);
    for (int i=0; i < 5; i++) {
      line(x, y-r, x + r/3, y - r/3);
      line(x, y-r, x - r/3, y - r/3);
      translate(x, y);
      rotate(radians(72));
      translate(-x, -y);
    }
    popMatrix();
    
    pushMatrix();
    noFill();
    stroke(c);
    strokeWeight(r/4);
    translate(x, y);
    rotate(radians(-45));
    translate(-x, -y);
    line(x-r/2, y, x-r-l, y);
    
    fill(c);
    noStroke();
    ellipseMode(CENTER);
    ellipse(x-r-l, y, r/2, r/2);
    popMatrix();
  }
}
