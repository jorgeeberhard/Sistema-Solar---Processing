class Moon {
  // theta guarda o angulo atual da orbita da lua.
  float theta;

  // diameter guarda o tamanho visual da lua.
  float diameter;

  // distance guarda a distancia da lua em relacao ao planeta.
  float distance;

  // orbitspeed guarda a velocidade angular da lua.
  float orbitspeed;

  // Construtor da lua.
  // distance_ = distancia ate o planeta.
  // diameter_ = tamanho da lua.
  Moon(float distance_, float diameter_) {
    // Copia os valores recebidos para os atributos.
    distance = distance_;
    diameter = diameter_;

    // Angulo inicial da orbita.
    theta = 0;

    // Sorteia a velocidade angular da lua.
    // Como o intervalo vai de negativo a positivo,
    // algumas luas podem girar em sentido oposto.
    orbitspeed = random(-0.1, 0.1);
  }

  // update() altera o estado interno da lua.
  void update() {
    // Soma a velocidade angular ao angulo atual.
    theta += orbitspeed;
  }

  // display() desenha a lua.
  void display() {
    // Salva a matriz atual.
    // Aqui a lua ja herda o referencial do planeta porque foi chamada dentro de Planet.display().
    pushMatrix();

    // Gira o sistema de coordenadas pelo angulo atual da lua.
    rotate(theta);

    // Afasta a lua do planeta na distancia definida.
    // Como isso acontece depois do rotate(), a lua orbita o planeta.
    translate(distance, 0);

    // Borda preta.
    stroke(0);

    // Cor cinza para a lua.
    fill(175);

    // Desenha a lua na origem local atual.
    ellipse(0, 0, diameter, diameter);

    // Restaura a matriz anterior para nao afetar outros objetos.
    popMatrix();
  }
}
