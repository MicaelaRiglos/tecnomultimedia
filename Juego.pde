class Juego {

  Pantalla pantalla = new Pantalla();
  int estado = 0;

  Juego() {
  }

  void dibujar() {
    pantalla.dibujar();
  }

  void mouseMoved() {
    pantalla.mouseMoved();
  }

  void mouseClicked() {
    pantalla.mouseClicked();
  }
}
