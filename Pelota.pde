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
    this.x = x; // random( width );
    this.y = y; // height-200;
    this.vel = vel;
    this.velX = velX;
    this.velY = velY;
    this.tam = tam; // 20;
  }

  //METODOS
  void rebotar() {

    //bordes 
    
    if (x >= width-13) 
      velX = - vel;

    if (x <= 13) 
      velX = + vel;
 
    if (y >= height-7) 
      velY = - vel;

    if (y <= 65) 
      velY = + vel;

    //paleta
    if (x + 10 >= mouseX && x + 10 <= mouseX + 120 && y + 10 >= height-100 && y + 10 <= height-100 + 20 || y >= height-20) 
      velY = - vel;
    
    x+= velX ;
    y+= velY ;

  }

  void dibujar() {
    pushStyle();
    noStroke();
    fill(verde);
    circle(x, y, tam);
    popStyle();
  }
  
  void aumentarVel() {
    if (mousePressed) 
      vel += 0.1;
  }
  
  void reiniciar() {
    if (keyPressed && key == ' ') {
      vel = 2;
      velX = 2;
      velY = 2;
      x = random(width);
      y = random(height);
    }  
  }    
  
  
}

/*class Pelota
 
 PROPIEDADES
 posicion, velocidad(float), reinicio
 
 CONSTRUCTOR
 por parametro definir la posicion x e y en el centro de la paleta 
 si toca un borde, la peleta o un bloque rebota
 
 METODOS
 dibujar()
 va a dibujar una ellipse en las coordenadas x e y
 
 comenzar()
 va a comenzar a moverse cuando se haga click
 
 rebotar()
 va a rebotar cada vez que choque con una pared, la paleta o un bloque
 
 velocidad()
 va a aumentar la velocidad cada vez que rebote
 
 perder()
 cuando la pelota toque la base del rect de "jugando", va a llevan al estado "perdiste"
 
 reinicio()
 */
