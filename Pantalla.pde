class Pantalla {

  //PROPIEDADES------------------------------------

  PImage tiste, love, instruccion, win, volver;
  PFont fuente1, fuente2;
  boolean perdio = false; 
  boolean gano = false;
  int violeta, bordo, rojo, naranja, amarillo;

  AudioPlayer perdiste;
  AudioPlayer ganaste;
  AudioPlayer mybeat2;

  Boton botonInicio = new Boton(0);
  Boton botonInstrucciones = new Boton(1);
  Boton botonCreditos = new Boton(5);

  Bloque[] bloques;
  Pelota pelota;
  Paleta paleta;
  Puntaje puntaje;

  //CONSTRUCTOR-----------------------------------

  Pantalla() {

    perdiste = minim.loadFile("perdiste.wav");
    ganaste = minim.loadFile("ganaste.wav");
    mybeat2 = minim.loadFile("mybeat2.wav");

    imageMode (CENTER);
    tiste = loadImage ("triste.png");
    love = loadImage ("love.png");
    instruccion = loadImage ("inst.png");
    win = loadImage ("winner.png");
    volver = loadImage ("credit.png");
    fuente1 = createFont( "iomanoid.ttf", 65 );
    fuente2 = createFont( "pixel.TTF", 20 );
    //COLORES
    violeta = color( 88, 24, 69 );
    bordo = color( 144, 12, 63 );
    rojo = color( 199, 0, 57 );
    naranja = color( 255, 87, 51 );
    amarillo = color( 255, 195, 15 );

    bloques = new Bloque [24];

    //fila 1
    bloques [0] = new Bloque (30, 200, 1);
    bloques [1] = new Bloque(120, 200, 1);
    bloques [2] = new Bloque (210, 200, 1);
    bloques [3] = new Bloque (300, 200, 1);
    bloques [4] = new Bloque (390, 200, 1);
    bloques [5] = new Bloque (480, 200, 1);
    //fila 2
    bloques [6] = new Bloque (30, 250, 2);
    bloques [7] = new Bloque(120, 250, 2);
    bloques [8] = new Bloque (210, 250, 2);
    bloques [9] = new Bloque (300, 250, 2);
    bloques [10] = new Bloque (390, 250, 2);
    bloques [11] = new Bloque (480, 250, 2);
    //fila 3
    bloques [12] = new Bloque (30, 300, 3);
    bloques [13] = new Bloque(120, 300, 3);
    bloques [14] = new Bloque (210, 300, 3);
    bloques [15] = new Bloque (300, 300, 3);
    bloques [16] = new Bloque (390, 300, 3);
    bloques [17] = new Bloque (480, 300, 3);
    //fila 4
    bloques [18] = new Bloque (30, 350, 4);
    bloques [19] = new Bloque(120, 350, 4);
    bloques [20] = new Bloque (210, 350, 4);
    bloques [21] = new Bloque (300, 350, 4);
    bloques [22] = new Bloque (390, 350, 4);
    bloques [23] = new Bloque (480, 350, 4);

    pelota = new Pelota(random (10, 590), 450, 0.1, 0.1, 0.1, 20);
    paleta = new Paleta(height-100, 120, 20);
    puntaje = new Puntaje();
  }

  //METODOS---------------------------------------------------------------

  void dibujar() {

    if (juego.estado == 0) {
      this.dibujarInicio();
    }
    if (juego.estado == 1) {
      this.dibujarInstrucciones();
    }
    if (juego.estado == 2) {
      this.dibujarJugando();
    }
    if (juego.estado == 2 && gano==true) {
      juego.estado = 3;
      this.dibujarGanaste();
    }
    if (juego.estado == 2 && perdio==true) {
      juego.estado = 4;
      dibujarPerdiste();
    }
    if ((juego.estado == 3 || juego.estado == 4) && key == ' ') {
      juego.estado = 5;
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
    if (juego.estado == 5) {
      botonCreditos.mouseMoved();
    }
  }

  void mouseClicked() {
    if (juego.estado == 0) {
      botonInicio.mouseClicked();
    }
    if (juego.estado == 1) {
      botonInstrucciones.mouseClicked();
    }
    if (juego.estado == 5) {
      botonCreditos.mouseClicked();
    }
  }

  void reiniciar() {
    pelota.reiniciar();
    puntaje.punto = 0;
    this.crearBloques();
  }

  void MiTexto ( String texto, float tam, float x, float y, int MiColor ) {

    pushStyle();
    textAlign( CENTER );
    textSize( tam );
    fill ( MiColor );
    text( texto, x, y );
    popStyle();
  }

  //INICIO--------------------------------------------------------

  void dibujarInicio() {
    pushStyle();
    background(violeta);
    for ( int i = 0; i < 10; i ++ ) { 
      float tam =  random ( 20, 40 );
      noStroke();
      fill(255, random( 0, 180 ), random( 50, 100 ), 70);
      rect ( random(width), random( height ), tam, tam);
    }

    textFont(fuente1);
    MiTexto( "ARKAND", 100, width/2, 125, amarillo );
    MiTexto( "ARKAND", 100, width/2+2, 127, amarillo );
    MiTexto( "HIT IT HARD", 100, width/2, 205, amarillo );
    MiTexto( "HIT IT HARD", 100, width/2+2, 207, amarillo );
    image( love, width/2, height/2, 300, 300);
    textFont( fuente2 );
    MiTexto( "HAGA CLICK PARA COMENZAR\nEL JUEGO", 20, width/2, random( height/2+200, height/2+203 ), amarillo);

    botonInicio.dibujar(width/2-50, height-130, 100, "rect", "COMENZAR");
    mybeat2.play();
  }

  //INSTRUCCIONES----------------------------------------------------

  void dibujarInstrucciones() {
    background(violeta);
    for ( int i = 0; i < 10; i ++ ) { 
      float tam =  random ( 20, 40 );
      noStroke();
      fill(255, random( 0, 180 ), random( 50, 100 ), 70);
      rect ( random(width), random( height ), tam, tam);
    }
    fill( bordo );
    rect( 50, 100, 500, 600 );
    image( instruccion, width/2, 100, 150, 150);
    textFont( fuente2 );
    MiTexto( "INSTRUCCIONES", 40, width/2, height/2-200, color(amarillo) );
    MiTexto( "MUEVE EL MOUSE \nPARA GOLPEAR LA\nPELOTA", 20, width/2, random( height/2-113, height/2-110 ), color (amarillo) );
    if ( dist( mouseX, mouseY, width/2, height/2+200) <= 50 ) {
      fill( amarillo );
      circle( width/2, height/2+200, 100 );
      MiTexto( "start", 20, width/2, height/2+206, color (  255, 8, 74 ) );
    } else {
      fill( 255, 8, 74 );
      circle( width/2, height/2+200, 100 );
      MiTexto( "start", 20, width/2, height/2+206, color (181, 228, 140) );
    }

    MiTexto( "rompe todos\nlos bloques y\nNO LA DEJES\nCAER!", 30, width/2, height/2, color ( 255, 8, 74 ) );
    botonInstrucciones.dibujar(width/2-50, height/2+150, 100, "rect", "START");
  }

  //JUGANDO------------------------------------------------------------

  void dibujarJugando() {
    pushStyle();
    background(10);
    stroke(199, 0, 57);
    strokeWeight(10);
    fill(violeta);
    rect(0, height-(width+150), width, width+150);
    popStyle();

    this.crearBloques();
  }
  
  void crearBloques(){
    for (int i = 0; i < bloques.length; i++) {

      if (bloques[i] != null) {

        bloques[i].dibujar();

        if (bloques[i].tocado(pelota.getX(), pelota.getY())) {
          pelota.invertir();
          bloques[i] = null;
          puntaje.aumentar();
        }
      }

      pelota.dibujar();
      pelota.rebotar();
      pelota.reiniciar();
      paleta.dibujar();
      puntaje.dibujar();
      mybeat2.pause();

      if (pelota.getY() >= height-60) {
        perdio = true;
      }
      if (puntaje.punto == 24) { //modifico el puntaje necesario para ganar
        gano = true;
      }
      mybeat2.play();
    }
    
  }

  //GANASTE--------------------------------------------------------------

  void dibujarGanaste() {
    background( naranja );
    for ( int i = 0; i < 2; i ++ ) { //video, fondo de pantalla de inicio e instrucciones
      float tam =  random ( 20, 40 );
      noStroke();
      fill(255, random( 0, 180 ), random( 50, 100 ), 70);
      rect ( random(width), random( height ), tam, tam);
    }
    textFont( fuente2 );
    MiTexto( "Ganaste!", 80, width/2, 200, color ( amarillo ) );
    MiTexto( "PRESIONE LA BARRA \nESPACIADORA PARA VER \nLOS CREDITOS", 25, width/2, random ( height/2+260, height/2+263 ), color ( amarillo ) );
    image( win, 200, height/2, 500, 500);

    mybeat2.pause();
    ganaste.play();
  }

  //PERDISTE---------------------------------------------------------

  void dibujarPerdiste() {   
    background( 0, 89, 129 );

    for ( int i = 0; i < 100*5; i ++ ) { 
      float tam =  random ( 5, 50 );
      noStroke();
      fill(112, 214, 255, 70);
      rect ( random(width), random (height), 5, tam);
    }

    textFont( fuente2 );
    MiTexto( "Perdiste!", 80, width/2, 200, color ( 54, 191, 252 ) );
    MiTexto( "PRESIONE LA BARRA \nESPACIADORA PARA VER \nLOS CREDITOS", 25, width/2, random ( height/2+260, height/2+263 ), color ( 54, 191, 252 ) );
    image( tiste, width/2, height/2, 300, 300);

    ganaste.pause();
    mybeat2.pause();
    perdiste.play();
  }

  //CREDITOS-------------------------------------------------------------

  void dibujarCreditos() {
    background(violeta);

    textFont(fuente2);
    MiTexto("GRACIAS POR ELEGIRNOS COMO\nTU FORMA DE ENTRETENIMIENTO", 20, width/2, 55, color (255, 8, 74));

    image(volver, 530, 160, 120, 120);

    textFont(fuente1);
    MiTexto("ARKAND", 100, width/2, 200, color (amarillo));
    MiTexto("ARKAND", 100, width/2+2, 202, color (amarillo));
    MiTexto("HIT IT HARD", 100, width/2, 280, color (amarillo));
    MiTexto("HIT IT HARD", 100, width/2+2, 282, color(amarillo));

    textFont(fuente2);
    MiTexto("HECHO POR:", 13, width/2, 340, color (rojo));
    MiTexto("RIGLOS LLANO MICAELA Y\nSEGOVIA BRIZUELA DIANA", 17, width/2, 360, color (naranja));
    MiTexto("TECNO MULTIMEDIA 1, 2022", 20, width/2, 420, color (255, 8, 74));
    MiTexto("PROFESOR, FUENTE DE CONOCIMIENTO Y RECURSOS:", 13, width/2, 450, color (rojo));
    MiTexto("MATIAS JAUREGUI LORDA", 17, width/2, 470, color (naranja));
    MiTexto("TOBIAS ALBIROSA", 17, width/2, 490, color (naranja));
    MiTexto("BASADO EN EL JUEGO", 13, width/2, 530, color (rojo));
    MiTexto("''ARKANOID BREAK BREAKER''", 17, width/2, 550, color (naranja));
    MiTexto("IMAGENES OBTENIDAS DE:", 13, width/2, 590, color (rojo));
    MiTexto("https://www.freepng.es/hd-png/cat-pixel-art.html", 11, width/2, 610, color (naranja));
    MiTexto("TIPOGRAFIAS OBTENIDAS DE:", 13, width/2, 650, color (rojo));
    MiTexto("https://www.dafont.com/es/04b-30.font\nhttps://www.dafont.com/es/arkanoid.font", 11, width/2, 662, color (naranja));

    botonCreditos.dibujar(width/2, 700, 100, "rect", "VOLVER");
    perdiste.pause();
    ganaste.pause();
    mybeat2.play();
  }
}
