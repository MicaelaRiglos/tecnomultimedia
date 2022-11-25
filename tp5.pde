import ddf.minim.*;

Minim minim;

Juego juego;

void setup() {

  minim = new Minim(this);
  juego = new Juego();


  size( 600, 800 );
  textAlign( CENTER );
  imageMode( CENTER );

 /* //COLORES
  verdeclaro = color( 217, 237, 146 );
  verde = color( 181, 228, 140 );
  //verde = color( 118, 200, 147 );
  turquesa = color( 52, 160, 164 );
  azul = color( 26, 117, 159 );
  azulmarino = color( 24, 78, 119 );*/
}

void draw() {
  juego.dibujar();
}

void mouseMoved() {
  juego.mouseMoved();
}

void mouseClicked() {
  juego.mouseClicked();
  println(juego.estado);
}
