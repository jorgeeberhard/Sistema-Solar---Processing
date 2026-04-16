class Planet {
  // theta guarda o angulo atual da orbita do planeta ao redor do Sol.
  float theta;

  // diameter guarda o tamanho visual do planeta.
  float diameter;

  // distance guarda a distancia do planeta em relacao ao Sol.
  float distance;

  // orbitspeed guarda a velocidade angular do planeta.
  float orbitspeed;

  // Cada planeta tem pelo menos uma lua.
  Moon moon;

  // Alguns planetas podem ter uma segunda lua.
  Moon moon2;

  // Esta flag indica se o planeta realmente possui segunda lua.
  boolean second_moon = false;

  // Cor do planeta.
  color planet_color;

  // Construtor do planeta.
  // distance_ = distancia ate o Sol.
  // diameter_ = tamanho do planeta.
  // has_second_moon = define se ele tera uma segunda lua.
  Planet(float distance_, float diameter_, boolean has_second_moon) {
    // Copia os valores recebidos para os atributos do objeto.
    distance = distance_;
    diameter = diameter_;

    // Comeca com angulo 0.
    theta = 0;

    // Sorteia a velocidade angular do planeta.
    // Como os dois limites sao positivos, todos os planetas giram no mesmo sentido.
    orbitspeed = random(0.01, 0.03);

    // Cria a primeira lua com distancia e diametro aleatorios.
    moon = new Moon(random(1, 24), random(1, 8));

    // Define uma cor aleatoria para o planeta.
    planet_color = color(random(255), random(255), random(255));

    // Se este planeta foi escolhido para ter segunda lua,
    // cria uma segunda lua com parametros diferentes.
    if (has_second_moon) {
      moon2 = new Moon(random(1, 24), random(1, 8));
      second_moon = true;
    }
  }

  // update() altera o estado interno do planeta e de suas luas.
  void update() {
    // Aumenta o angulo do planeta.
    // Isso faz o planeta avancar na orbita a cada frame.
    theta += orbitspeed;

    // Atualiza a primeira lua.
    moon.update();

    // Se houver segunda lua, atualiza ela tambem.
    if (second_moon) {
      moon2.update();
    }
  }

  // display() desenha o planeta e as luas.
  void display() {
    // Salva a matriz atual antes de transformar.
    // Isso isola a orbita deste planeta das transformacoes dos outros.
    pushMatrix();

    // Gira o sistema de coordenadas pelo angulo atual do planeta.
    rotate(theta);

    // Move a origem para a distancia da orbita.
    // Como isso acontece depois do rotate(), o planeta fica em orbita.
    translate(distance, 0);

    // Borda preta.
    stroke(0);

    // Usa a cor aleatoria sorteada para este planeta.
    fill(planet_color);

    // Desenha o planeta na origem local atual.
    ellipse(0, 0, diameter, diameter);

    // Desenha a primeira lua.
    // Ela herdara a transformacao do planeta, por isso orbita o planeta e nao o Sol.
    moon.display();

    // Se existir segunda lua, desenha ela tambem.
    if (second_moon) {
      moon2.display();
    }

    // Restaura a matriz anterior.
    // Sem isso, o proximo planeta herdaria a rotacao e a translacao deste.
    popMatrix();
  }
}
