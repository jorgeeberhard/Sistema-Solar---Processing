class Planet {
  // Each planet object keeps track of its own angle of rotation.
  float theta;      // Rotation around sun
  float diameter;   // Size of planet
  float distance;   // Distance from sun
  float orbitspeed; // Orbit speed
 
  // Each Planet now has a Moon!
  Moon moon;
  Moon moon2;
  boolean second_moon = false;
  
  Planet(float distance_, float diameter_, boolean has_second_moon) {
    distance = distance_;
    diameter = diameter_;
    theta = 0;
    orbitspeed = random(0.01,0.03);
    
    // create the Moon 24 pixels from the planet with a diameter of 5
    moon = new Moon(24,8);
    
    if(has_second_moon) {
      moon2 = new Moon(24, 8);
      second_moon = true;
    }
  }
  
  void update() {
    // Increment the angle to rotate
    theta += orbitspeed;
    // Update the moon
    moon.update();
    
    if(second_moon) {
      moon2.update();
    }
  }
  
  void display() {
    // Before rotation and translation, the state of the matrix is saved with pushMatrix().
    pushMatrix(); 
    // Rotate orbit
    rotate(theta); 
    // translate out distance
    translate(distance,0); 
    stroke(0);
    fill(175);
    ellipse(0,0,diameter,diameter);
    // The planet is drawn, now draw the moon
    moon.display();
    
    if(second_moon) {
      moon2.display();
    }
    
    // Once the planet is drawn, the matrix is restored with popMatrix() so that the next planet is not affected.
    popMatrix(); 
  }
}
