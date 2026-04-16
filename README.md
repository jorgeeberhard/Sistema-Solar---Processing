## Etapa 2

A incrementação do theta é feito dentro da função `update()` das classes `Planet` e `Moon`

A incrementação de theta é feita através do orbitspeed, que é um número aleatório gerado ao instânciar a classe.

No caso da classe `Planet`, é gerado nesta linha: `orbitspeed = random(0.01,0.03);`

Caso o planeta possua segunda lua, ele executa o `update()` da segunda lua também, se não, executa apenas da primeira lua.

No caso da classe `Moon`, é gerado nesta linha: `orbitspeed = random(-0.1,0.1);`

Como a geração do `orbitspeed` da lua abrange um número negativo, isso possibilita a movimentação antiorária das luas geradas.

![bullet points](./bullet-points.png)
