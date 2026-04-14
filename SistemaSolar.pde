// An array of 3 planet objects
Planet[] planets = new Planet[3];

void setup() {
  size(480, 270);

  int planeta_com_segunda_lua = int(random(planets.length));

  // The planet objects are initialized using the counter variable
  for (int i = 0; i < planets.length; i++ ) {
    boolean segunda_lua = (i == planeta_com_segunda_lua);
    planets[i] = new Planet(60 + i*36, 24, segunda_lua);
  }
}

void draw() {
  background(255);

  // Drawing the Sun
  pushMatrix();
  translate(width/2, height/2);
  stroke(0);
  fill(255);
  ellipse(0, 0, 64, 64);

  // Drawing all Planets
  for (int i = 0; i < planets.length; i++ ) {
    planets[i].update();
    planets[i].display();
  }
  popMatrix();
}
