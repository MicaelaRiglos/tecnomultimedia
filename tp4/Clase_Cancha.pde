class Cancha {
  float x;
  float y;
  color colorBorde; //cambia de color cuando se presiona la barra espaciadora, click para auentar kla velocidad
  color colorCancha;
  int alto;
  int largo;
  int tamBorde;
  Fantasma [] fantasmas = new Fantasma[15];
  Paleta aa;

  Cancha(float _x, float _y, color _colorBorde, color _colorCancha, int _alto, int _largo, int _tamBorde) {
    x = _x; //0
    y = _y; //height-(width+150)
    colorBorde = _colorBorde; //rojo
    colorCancha = _colorCancha; //violeta
    alto = _alto; //width
    largo = _largo; //width+150
    tamBorde = _tamBorde; //10
    
    for (int i = 0; i < fantasmas.length; i++) {
      fantasmas[i].asustar();
    }

    for (int i = 0; i < fantasmas.length; i++) {
      fantasmas[i] = new Fantasma(random(width), random(height), 0, 2, 2, 20, color(255, random( 0, 180 ), random( 50, 100 ), 220));
    }

    aa = new Paleta(height-100, 120, 20, color(rojo));
  }

  void dibujar() {
    pushStyle();
    stroke(colorBorde);
    strokeWeight(tamBorde);
    fill(colorCancha);
    rect(x, y, alto, largo);
    popStyle();

    for (int i = 0; i < fantasmas.length; i++) {
      fantasmas[i].rebotar();
      fantasmas[i].dibujar();
      fantasmas[i].aparecer();
      fantasmas[i].aumentarVel();
    }

    aa.dibujar();
  }
}
