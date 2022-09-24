class Paleta {
  float y;
  int alto;
  int largo;
  color coloracion;

  Paleta(float _y, int _alto, int _largo, color _coloracion) {
    y = _y; //height-100
    alto = _alto; //120
    largo = _largo; //20
    coloracion = _coloracion; //rojo
  }

  void dibujar() {
    pushStyle();
    noStroke();
    fill(coloracion);
    rect(mouseX, y, alto, largo);
    popStyle();
  }
}

/*

 MI CLASE PALETA
 
 PROPIEDADES
 posicion, tamanio
 
 CONSTRUCTOR
 - el tamanio de la paleta va a ser de 120 de largo y 20 de alto
 - la posicion de x va a ser la de mouseX y la de y height-100
 
 METODOS
 dibujar()
 va a dibujar un rect en las coordenadas x e y con su determinado tamanio 
 
 */
