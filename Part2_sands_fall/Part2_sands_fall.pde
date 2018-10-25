/*
Part 2. Sands fall down to create different mountains, valleys and dunes.

Part2 Pseudocode:
1. Use pixels to create sands.
2. Sand falls under the influence of gravity and resistance from water.
3. Sands won't mixed.
4. When sand hits the boundary of the display window, it will bounce and finally
stay in the bottom under the influence of friction.
5. When sand hits other sands, it will bounce and finally stay in the edge of 
dunes under the influence of friction.

#have trouble in #3
*/

Sand[] sands = new Sand[100];

void setup() {
  size(640, 360);
  for (int i = 0; i < sands.length; i++) {
    sands[i] = new Sand(random(8, 10), random(width), 0);
  }
}

void draw() {
  background(255);
  
  for (int i = 0; i < sands.length; i++) {
    PVector resistance = new PVector(0, -0.08);
    float m = sands[i].mass;
    PVector gravity = new PVector(0, 0.1*m);
    sands[i].applyForce(resistance);
    sands[i].applyForce(gravity);
    
    sands[i].update();
    sands[i].display();
    sands[i].checkEdges();
  }
}
