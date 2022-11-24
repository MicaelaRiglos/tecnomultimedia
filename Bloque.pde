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
      fill(217, 237, 146);
    }
    if (colorci == 2) {
      fill(181, 228, 140);
    }
    if (colorci == 3) {
      fill(118, 200, 147);
    }
    if (colorci == 4) {
      fill(52, 160, 164);
    }

    rect(x, y, 85, 30);

    popStyle();
  }

  boolean tocado (float posX, float posY) {

    boolean pum = false;
    boolean romper = false;


    if ((posX) < x || posX > (x + 85)) {

      pum = false;
      //pop.pause();
    } else if ((posY) < y || posY > (y + 30)) {

      pum = false;
     // pop.pause();
    } else if (romper == false) {

      pum = true;
      pop.play();
    }

    {

      if (pum){
        colorci--;
      
    }  
    return pum;
  }
}
}
/* class Bloque
 
 PROPIEDADES
 posicion, tamanio, color
 
 CONSTRUCTOR
 defino por parametros la posicion de x e y 
 de tamanio
 y de color
 
 METODOS
 dibujar()
 va a dibujar un rect en las cordenadas de x e y con su determinado tamanio y color
 
 pum()
 //agregar un boolean para ver si colisiona
 cuando la pelota colisione con el bloque, este va a romperse modofocar el color
 */
