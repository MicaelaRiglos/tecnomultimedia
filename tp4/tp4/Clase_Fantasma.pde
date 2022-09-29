class Fantasma {
  float x;
  float y;
  float vel;
  float velX;
  float velY;
  int tam;
  color coloracion;

  Fantasma(float _x, float _y, float _vel, float _velX, float _velY, int _tam, color _coloracion) {
    x = _x; // random( width );
    y = _y; // height-200;
    vel = _vel;
    velX = _velX;
    velY = _velY;
    tam = _tam; // 20;
    coloracion = _coloracion; //color( 255, random( 0, 180 ), random( 50, 100 ), 220 );
  }

  void rebotar() {

    //bordes 
    if (x >= width-20) {
      velX = -2 - vel;
    }

    if (x <= 20) {
      velX = +2 + vel;
    }
 
    if (y >= height-20) {
      velY = -1 - vel;
    }

    if (y <= 20) {
      velY = +2 + vel;
    }

    //paleta
    if (x + 10 >= mouseX && x + 10 <= mouseX + 120 && y + 10 >= height-100 && y + 10 <= height-100 + 20 || y >= height-20) {
      velY = -2 - vel;
    }
    
   
    x+= velX + vel;
    y+= velY + vel;

  }

  void dibujar() {
    pushStyle();
    noStroke();
    fill(coloracion);
    circle(x, y, tam);
    fill(255);
    circle(x, y, tam -10);
    fill(0);
    circle(x, y, tam -15);
    popStyle();
  }
  
  void aumentarVel() {
    if (mousePressed) { 
      vel += 0.1;
    }
  }
  
  void aparecer() {
    if (keyPressed && key == ' ') {
      vel = 0;
      velX = 2;
      velY = 2;
      x = random(width);
      y = random(height);
    }  
  }    
  
  void asustar(){ //this.coloracion
    if(keyPressed && key == 'a' || key == 'A'){
      coloracion = color(0);
      tam = 30;
    } else {
      coloracion = color(255, random( 0, 180 ), random( 50, 100 ), 220);
      tam = 20;
    }
  }
  
  
}



/*

 MI CLASE PELOTA
 
 PROPIEDADES
 posicion, velocidad, tamanio
 
 CONSTRUCTOR
 - el tam de la pelota va a ser de 20
 - la posicion de x es random en el width de la pantalla y la posicion de y es height-200
 - la velocidad es igual a 1
 
 METODOS
 rebotar() 
 si la pelota toca la paleta, un bloque o un borde, rebota 
 aumentoDeVel()
 cada vez que rebota se suma el valor de vel a las variables posX y PosY
 
 dibujar()
 va a dibujar un circle en las coordenadas x e y con su determinado tamanio y ya en movimiento
 
 */
