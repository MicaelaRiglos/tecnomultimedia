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

    //  println(this.hover);

    if (tipo.equals("rect")) {
      this.x = x;
      this.y = y;
      this.tam = tam;

      if (this.hover) {
        pushStyle();
        relleno = color(255, 0, 0);
        popStyle();
      } else {
        pushStyle();
        relleno = color(0, 255, 0);
        popStyle();
      }
      pushStyle();
      fill(relleno);
      rect(x, y, tam, tam);
      text(texto, x, y);
      popStyle();
    }
  }
  void mouseClicked() {
    println("click");
    if (this.hover == true) {
      //  println("true(1.43)");
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
      //println("true(2.46)");
    } else {
      this.hover = false;
      //  println("false(1.49)");
    }
  }

  // DEPENDIENDO DEL ID (pasado por parametro)
  // DEL BOTON, HACEMOS UNA COSA U OTRA
  void accion(int id) {

    println("accion ", id);
    switch(id) {

    case 0:
      //println("click");
      juego.estado = 1;
      break;

    case 1:
      juego.estado = 2;
      break;

    case 2:
      juego.estado = 3;
      break;

    case 3:
      juego.estado = 4;
      break;

    case 4:
      juego.estado = 5;
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

/* class Boton
 
 PROPIEDADES
 posicion, tamanio, color, hover, texto, id
 
 CONSTRUCTOR
 declaro por paraemtro el id
 
 METODOS
 dibujar()
 mouseClicked()
 mouseMoved()
 void accion(int id)
 
 ejemplo de la clase de tobias
 */
