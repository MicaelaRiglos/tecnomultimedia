//Riglos Llano Micaela (91342/2) y Segovia Brizuela Diana Aidee (91381/9)
//https://youtu.be/jKrwWIfKPoM

import ddf.minim.*;

Minim minim;

//Juego juego;
Pantalla pantalla;

  void setup() {

  minim = new Minim(this);
  //juego = new Juego();
  pantalla = new Pantalla();


  size( 600, 800 );
  textAlign( CENTER );
  imageMode( CENTER );
}

void draw() {
  pantalla.dibujar();
}

void keyPressed() {
  pantalla.keyPressed();
}

void mouseClicked() {
  pantalla.mouseClicked();
}
