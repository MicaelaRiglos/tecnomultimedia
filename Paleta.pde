class Paleta {
  
  //PROPIEDADES
  float y;
  int alto;
  int largo;
  
  //CONSTRUCTOR
  Paleta(float _y, int _alto, int _largo) {
    y = _y; //height-100
    alto = _alto; //120
    largo = _largo; //20
  }
  
  //METODOS
  void dibujar() {
    pushStyle();
    noStroke();
    fill(verde);
    rect(mouseX, y, alto, largo);
    popStyle();
  }
}

/* class Paleta

PROPIEDADES
posicion, tamanio, color, 

CONSTRUCTOR
por parametro definir el tamanio
la posicion de x e y en el centro y la parte inferior de la pantalla

METODOS
dibujar()
moverse con la posicion del mouse

*/
