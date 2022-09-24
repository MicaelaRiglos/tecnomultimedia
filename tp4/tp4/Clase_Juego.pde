class Juego {
  float x;
  float y;
  color borde; //cambia de color cuando se presiona la barra espaciadora, click para auentar kla velocidad
  color cancha;
  int alto;
  int largo;
  int tamBorde;
  Fantasma [] fantasmas = new Fantasma[15];
  Paleta aa;

  Juego(float _x, float _y, color _borde, color _cancha, int _alto, int _largo, int _tamBorde) {
    x = _x; //0
    y = _y; //height-(width+150)
    borde = _borde; //rojo
    cancha = _cancha; //violeta
    alto = _alto; //width
    largo = _largo; //width+150
    tamBorde = _tamBorde; //10


    for (int i = 0; i < fantasmas.length; i++) {
      fantasmas[i] = new Fantasma(random(width), random(height), 2, 2, 20, color(255, random( 0, 180 ), random( 50, 100 ), 220));
    }

    aa = new Paleta(height-100, 120, 20, color(rojo));
  }

  void dibujar() {
    pushStyle();
    stroke(borde);
    strokeWeight(tamBorde);
    fill(cancha);
    rect(x, y, alto, largo);
    popStyle();

    for (int i = 0; i < fantasmas.length; i++) {
      fantasmas[i].rebotar();
      fantasmas[i].dibujar();
    }

    aa.dibujar();
  }
}
