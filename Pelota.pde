class Pelota {

  //PROPIEDADES
  float x;
  float y;
  float vel;
  float velX;
  float velY;
  int tam;

  //CONSTRUCTOR
  Pelota(float x, float y, float vel, float velX, float velY, int tam) {
    this.x = x; 
    this.y = y; 
    this.vel = vel;
    this.velX = velX;
    this.velY = velY;
    this.tam = tam; 
  }

  //METODOS
  void rebotar() {
    //bordes 
    if (x >= width-13) {
      velX = - vel;
    }
    if (x <= 13) {
      velX = + vel;
    }
    if (y >= height-7) {
      velY = - vel;
    }
    if (y <= 65) {
      velY = + vel;
    }

    //paleta
    if (x + 10 >= mouseX && x + 10 <= mouseX + 120 && y + 10 >= height-100 && y + 10 <= height-100 + 20 || y >= height-20) {
      velY = - vel;
    }

    x+= velX ;
    y+= velY ;
  }

  void dibujar() {
    pushStyle();
    noStroke();
    fill(255, 195, 15);
    circle(x, y, tam);
    popStyle();
  }

  void reiniciar() {
    if (keyPressed && key == ' ') {
      vel = 7;
      velX = 7;
      velY = 7;
      x = random (10, 590);
      y = height/2;
    }
  }    

  void invertir() {
    velY = velY * -1;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }
}
