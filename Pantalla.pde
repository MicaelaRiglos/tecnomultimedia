class Pantalla {

  Boton botonInicio = new Boton(0);
  Boton botonInstrucciones = new Boton(1);
  Boton botonJugando = new Boton(2);
  Boton botonGanaste = new Boton(3);
  Boton botonPerdiste = new Boton(4);
  Boton botonCreditos = new Boton(5);

  Bloque[] bloques = new Bloque[6];
  
  Pelota pelota;
  Paleta paleta;

  String nombreDePantalla = "inicio";

  Pantalla() {

    for (int i = 0; i < bloques.length; i++) {
      bloques[i] = new Bloque(20+i*95, 200);
    }
    }
    
    pelota = new Pelota(width/2, height/2, 2, 2, 2, 20);
    paleta = new Paleta(height-100, 120, 20);
    
  }

  void dibujar() {

    println("Estado: ", juego.estado);
    if (juego.estado == 0) {
      this.nombreDePantalla = "inicio";
      this.dibujarInicio();
    }
    if (juego.estado == 1) {
      this.nombreDePantalla = "instrucciones";
      this.dibujarInstrucciones();
    }
    if (juego.estado == 2) {
      this.nombreDePantalla = "jugando";
      this.dibujarJugando();
    }
    if (juego.estado == 3) {
      this.nombreDePantalla = "ganaste";
      this.dibujarGanaste();
    }
    if (juego.estado == 4) {
      this.nombreDePantalla = "perdiste";
      this.dibujarPerdiste();
    }
    if (juego.estado == 5) {
      this.nombreDePantalla = "creditos";
      this.dibujarCreditos();
    }
  }

  void mouseMoved() {
    if (juego.estado == 0) {
      botonInicio.mouseMoved();
    }
    if (juego.estado == 1) {
      botonInstrucciones.mouseMoved();
    }
    if (juego.estado == 2) {
      botonJugando.mouseMoved();
    }
    if (juego.estado == 3) {
      botonGanaste.mouseMoved();
    }
    if (juego.estado == 4) {
      botonPerdiste.mouseMoved();
    }
    if (juego.estado == 5) {
      botonCreditos.mouseMoved();
    }
  }
  void mouseClicked() {
    switch(juego.estado) {

    case 0:
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

      //default:
      // break;
    }
  }
  void dibujarInicio() {
    pushStyle();
    background(azulmarino);
    MiTexto( "ARKAND", 100, width/2, 125, verdeclaro );
    MiTexto( "ARKAND", 100, width/2+2, 127, verdeclaro );
    MiTexto( "HIT IT HARD", 100, width/2, 205, verdeclaro );
    MiTexto( "HIT IT HARD", 100, width/2+2, 207, verdeclaro );

    MiTexto( "HAGA CLICK PARA COMENZAR\nEL JUEGO", 20, width/2, random( height/2+200, height/2+203 ), verdeclaro);
    //ID en el ultimo parametro
    popStyle();
    botonInicio.dibujar(width/2, height/2, 40, "rect", "comenzar");
  }

  void dibujarInstrucciones() {
    background(240);
    //ID en el ultimo parametro
    botonInstrucciones.dibujar(width/2, height/2, 40, "rect", "start");
  }

  void dibujarJugando() {

    pushStyle();
    background(10);
    stroke(verde);
    strokeWeight(10);
    fill(azulmarino);
    rect(0, height-(width+150), width, width+150);
    popStyle();

    for (int i = 0; i < bloques.length; i++) {
      bloques[i].dibujar();
    }
    
    pelota.dibujar();
    pelota.rebotar();
    pelota.reiniciar();
    paleta.dibujar();

    //bloques();
    //ID en el ultimo parametro
    botonJugando.dibujar(width/2, height/2, 40, "rect", "game");
  }

  void dibujarGanaste() {

    background(220);
    //ID en el ultimo parametro
    botonGanaste.dibujar(width/2, height/2, 40, "rect", "continuarG");
  }
  void dibujarPerdiste() {

    background(210);
    //ID en el ultimo parametro
    botonPerdiste.dibujar(width/2, height/2, 40, "rect", "continuarP");
  }

  void dibujarCreditos() {

    background(200);
    //ID en el ultimo parametro
    botonCreditos.dibujar(width/2, height/2, 40, "rect", "continuarC");
  }
}

/*MI CLASE PANTALLAS
 class Pantallas{
 
 inicializo a 
 botonInicio, botonInstrucciones, botonJugando, botosGanaste, botonPerdiste, botonCreditos
 
 PROPIEDADES
 String nombreDePantalla;
 
 METODOS
 void dibujar(){
 }
 void Mousemoved(){
 }
 void MouseClicked(){
 }
 void dibujarInicio(){
 }
 void dibujarInstrucciones(){
 }
 void dibujarJugando(){
 }
 void dibujarGanaste(){
 }
 void dibujarPerdiste(){
 }
 void dibujarCreditos(){
 }
 ejemplo de la clase de tobias
 }
 }*/
