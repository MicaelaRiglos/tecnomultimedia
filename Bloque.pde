class Bloque {
  AudioPlayer pop;

  int x, y;
  float colorci;

  Bloque(int x, int y, float colorci) {
    pop = minim.loadFile("pop.wav");
    this.x = x;
    this.y = y; 
    this.colorci = colorci;
  }

  void dibujar() {
    pushStyle();
    noStroke();

    if (colorci == 1) {
      fill(255, 195, 15);
    }

    if (colorci == 2) {
      fill(255, 87, 51);
    }

    if (colorci == 3) {
      fill(199, 0, 57);
    }

    if (colorci == 4) {
      fill(144, 12, 63);
    }

    rect(x, y, 85, 30);
    popStyle();
  }

  boolean tocado (float posX, float posY) {

    boolean pum = false;
    boolean romper = false;


    if ((posX) < x || posX > (x + 85)) {
      pum = false;
    } else if ((posY) < y || posY > (y + 30)) {
      pum = false;
    } else if (romper == false) {
      pum = true;
      pop.play();
    }

    return pum;
  }
}
