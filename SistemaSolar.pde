// Vetor com 3 objetos do tipo Planet.
// Cada posicao do array vai guardar um planeta diferente.
Planet[] planets = new Planet[3];

// setup() executa uma unica vez, no inicio do programa.
void setup() {
  // Define o tamanho da janela.
  size(480, 270);

  // Sorteia qual planeta vai receber uma segunda lua.
  // random(planets.length) gera um valor entre 0 e 3.
  // int(...) converte esse valor para 0, 1 ou 2.
  int planeta_com_segunda_lua = int(random(planets.length));

  // Percorre o array de planetas.
  for (int i = 0; i < planets.length; i++ ) {
    // Esta variavel vira true apenas para o planeta sorteado acima.
    boolean segunda_lua = (i == planeta_com_segunda_lua);

    // Cria um novo planeta.
    // 60 + i*36 define distancias diferentes em relacao ao Sol.
    // 24 eh o diametro do planeta.
    // segunda_lua define se esse planeta tera uma segunda lua.
    planets[i] = new Planet(60 + i*36, 24, segunda_lua);
  }
}

// draw() executa continuamente, frame apos frame.
void draw() {
  // Limpa a tela a cada frame com fundo branco.
  background(255);

  // Salva a matriz atual.
  // Neste momento a origem ainda esta no canto superior esquerdo da tela.
  pushMatrix();

  // Move a origem do sistema de coordenadas para o centro da janela.
  // Isso faz o Sol ser desenhado no centro.
  translate(width/2, height/2);

  // Define a cor da borda das formas como preta.
  stroke(0);

  // Define o preenchimento como branco.
  fill(255);

  // Desenha o Sol na origem atual.
  // Como a origem foi movida para o centro, o Sol aparece no centro da tela.
  ellipse(0, 0, 64, 64);

  // Percorre todos os planetas para atualizar e desenhar cada um.
  for (int i = 0; i < planets.length; i++ ) {
    // update() altera os dados internos do planeta, como theta.
    planets[i].update();

    // display() desenha o planeta e suas luas.
    planets[i].display();
  }

  // Restaura a matriz salva no pushMatrix().
  // Isso desfaz o translate() do Sol e evita que a transformacao vaze.
  popMatrix();
}
