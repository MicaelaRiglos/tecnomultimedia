class Boton {

  float x, y, tam;
  color relleno;
  boolean hover;
  String texto;
  int botonID;

  Boton(int id) {
    this.botonID = id;
  }

  Boton(float x, float y, float tam, color relleno, String texto, int id) {
    this.x = x;
    this.y = y;
    this.tam = tam;
    this.relleno = relleno;
    this.texto = texto;
    this.botonID = id;
  }

  void dibujar(float x, float y, float tam, String tipo, String texto) {

    if (tipo.equals("rect")) {
      this.x = x;
      this.y = y;
      this.tam = tam;

      if (this.hover) {
        pushStyle();
        relleno = color(255, 87, 51);
        popStyle();
      } else {
        pushStyle();
        relleno = color(255, 195, 15);
        popStyle();
      }
      pushStyle();
      noStroke();
      fill(relleno);
      rect(x, y, tam, tam);
      fill (0);
      text(texto, x+50, y+55);
      popStyle();
    }
  }
  
  void mouseClicked() {
    if (this.hover == true) {
      this.accion(this.botonID);
    }
  }
  //LOGICA DE MOUSE OVER
  void mouseMoved() {

    if (mouseX > this.x 
      && mouseY > this.y
      && mouseX < this.x + this.tam 
      && mouseY < this.y + this.tam) {
      this.hover = true;
    } else {
      this.hover = false; 
    }
  }

  // DEPENDIENDO DEL ID (pasado por parametro)
  // DEL BOTON, HACEMOS UNA COSA U OTRA
  void accion(int id) {
    
    switch(id) {

    case 0:
      juego.estado = 1;
      break;

    case 1:
      juego.estado = 2;
      break;

    case 5:
      juego.estado = 0;
      break;

    default:
      break;
    }
    this.hover = false;
  }
}
