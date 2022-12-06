class Juego {

  //PROPIEDADES------------------------------------

  PImage tiste, love, instruccion, win, volver, iniciar, instruc, juego;
  PFont fuente1, fuente2;
  int violeta, bordo, rojo, naranja, amarillo;

  String estado;

  AudioPlayer perdiste;
  AudioPlayer ganaste;
  AudioPlayer mybeat2;

  Bloque[] bloques;
  Pelota pelota;
  Paleta paleta;
  Puntaje puntaje;
  int victorias, derrotas;

  //CONSTRUCTOR-----------------------------------

  Juego() {

    estado = "inicio";

    perdiste = minim.loadFile("perdiste.wav");
    ganaste = minim.loadFile("ganaste.wav");
    mybeat2 = minim.loadFile("mybeat2.wav");

    imageMode (CENTER);
    tiste = loadImage ("triste.png");
    love = loadImage ("love.png");
    instruccion = loadImage ("inst.png");
    win = loadImage ("winner.png");
    volver = loadImage ("credit.png");

    iniciar = loadImage ("flota.jpg");
    instruc = loadImage ("Molinos.jpg");
    juego = loadImage ("StudioGhibli.png");

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

    pelota = new Pelota(random (10, 590), height/2, 7, 7, 7, 20);
    paleta = new Paleta(height-100, 120, 20);
    puntaje = new Puntaje();
    victorias = derrotas = 0;
  }

  //METODOS---------------------------------------------------------------

  void dibujar() {

    if ( estado.equals( "inicio" ) ) {
      dibujarInicio();
      
      mybeat2.rewind();
      mybeat2.play();
      
    } else if ( estado.equals( "instrucciones" ) ) {
      dibujarInstrucciones();
      
      mybeat2.play();
      
    } else if ( estado.equals( "jugando")  ) {
      dibujarJugando();
      
      mybeat2.rewind();
      mybeat2.play();
      
    } else if ( estado.equals( "ganaste" ) ) {
      dibujarGanaste();
      
      mybeat2.pause();
      ganaste.rewind();
      ganaste.play();
      
    } else if ( estado.equals( "perdiste" ) ) {
      dibujarPerdiste();
      
      mybeat2.pause();
      perdiste.rewind();
      perdiste.play();
      
    } else if ( estado.equals("creditos") ) {
      dibujarCreditos();
      
      perdiste.pause();
      ganaste.pause();
      mybeat2.rewind();
      mybeat2.play();
    }
  }

  void mouseClicked() {//lo utilizamos para cambiar de estado, ya sea con botones o en cualquier lugar de la pantalla
    if ( estado.equals( "inicio" ) && mouseX > width/2-100 && mouseX < width/2+100 && mouseY > height-120 && mouseY < height-50 ) {
      estado = "instrucciones";
    }
    if ( estado.equals( "instrucciones" ) && dist( mouseX, mouseY, width/2, height/2+200 ) <= 50) {
      estado = "jugando";
    } 

    if ( estado.equals( "perdiste" ) ) { //video, se suman las derrotas cuando hacemos click en el estado de "perdiste"
      estado = "creditos";
      derrotas++;
    } 
    if ( estado.equals( "ganaste" ) ) { //video, se suman las victorias cuando hacemos click en el estado de "ganaste"
      estado = "creditos";
      victorias++;
    }
  }

  //-----------------------------------------------------------------------------------------------------------------------------------------------------

  void keyPressed() {
    if ( estado.equals( "creditos" ) ) {
      if ( keyPressed  && key == ' ' ) {
        reiniciar();
      }
    }
  }

  //INICIO--------------------------------------------------------

  void dibujarInicio() {

    //mybeat2.rewind();
    //mybeat2.play();
    pushStyle();
    background(violeta);
    tint(255, 255, 255, 100);
    image( iniciar, width/2, height/2-100, 600, 1000);
    popStyle();
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

    textFont( fuente2 );
    MiTexto( "HAGA CLICK PARA COMENZAR\nEL JUEGO", 20, width/2, random( height/2+200, height/2+203 ), amarillo);

    MiTexto ( "Victorias: " + victorias + "\nDerrotas: " + derrotas, 25, width/2, 300, amarillo ); //video

    image( love, width/2, height/2+70, 250, 250);

    //video, boton de comenzar, cambia de color si esta dentro o fuera de los limites
    //video, si hacemos click dentro de los limites pasamos al estado de instrucciones
    if ( mouseX > width/2-100 && mouseX < width/2+70 && mouseY > height-120 && mouseY < height-50 ) {
      fill( amarillo );
      rect( width/2-100, height-120, 200, 70 );
      MiTexto( "COMENZAR", 20, width/2, height-75, color ( 255, 8, 74 ) );
    } else {
      fill( 255, 8, 74 );
      rect( width/2-100, height-120, 200, 70 );
      MiTexto( "COMENZAR", 20, width/2, height-75, amarillo );
    }
  }

  //INSTRUCCIONES----------------------------------------------------

  void dibujarInstrucciones() {

    //mybeat2.rewind();
    //mybeat2.play();
    background(violeta);
    pushStyle();
    tint(255, 255, 255, 100);
    image( instruc, width/2, height/2, 600, 800);
    popStyle();
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
      MiTexto( "start", 20, width/2, height/2+206, color (amarillo) );
    }

    MiTexto( "rompe todos\nlos bloques y\nNO LA DEJES\nCAER!", 30, width/2, height/2, color ( 255, 8, 74 ) );
  }

  //JUGANDO------------------------------------------------------------

  void dibujarJugando() {
    //mybeat2.rewind();
    //mybeat2.play();
    pushStyle();
    background(10);
    stroke(199, 0, 57);
    strokeWeight(10);
    fill(violeta);
    rect(0, height-(width+150), width, width+150);
    tint(255, 255, 255, 90);
    image( juego, width/2, height/2+25, 590, 740);
    popStyle();

    for (int i = 0; i < bloques.length; i++) {

      if (bloques[i] != null) {

        bloques[i].dibujar();

        if (bloques[i].tocado(pelota.getX(), pelota.getY())) {
          pelota.invertir();
          bloques[i] = null;
          puntaje.aumentar();
        }
      }
    }

    pelota.dibujar();
    pelota.rebotar();
    pelota.reiniciar();
    paleta.dibujar();
    puntaje.dibujar();

    if (pelota.getY() >= height-60) {
      estado = "perdiste";
    }
    if (puntaje.punto == 24) { //modifico el puntaje necesario para ganar
      estado = "ganaste";
    }
  }

  //GANASTE--------------------------------------------------------------

  void dibujarGanaste() {
    //mybeat2.pause();
    //ganaste.rewind();
    //ganaste.play();
    background( naranja );
    for ( int i = 0; i < 2; i ++ ) { //video, fondo de pantalla de inicio e instrucciones
      float tam =  random ( 20, 40 );
      noStroke();
      fill(255, random( 0, 180 ), random( 50, 100 ), 70);
      rect ( random(width), random( height ), tam, tam);
    }
    textFont( fuente2 );
    MiTexto( "Ganaste!", 80, width/2, 200, color ( amarillo ) );
    MiTexto( "HAGA CLICK PARA VER LOS\nCREDITOS", 25, width/2, random ( height/2+260, height/2+263 ), color ( amarillo ) );
    image( win, 200, height/2, 500, 500);
  }

  //PERDISTE---------------------------------------------------------

  void dibujarPerdiste() {  
    //mybeat2.pause();
    //perdiste.rewind();
    //perdiste.play();
    background( 0, 89, 129 );

    for ( int i = 0; i < 100; i ++ ) { 
      float tam =  random ( 5, 50 );
      noStroke();
      fill(112, 214, 255, 70);
      rect ( random(width), random (height), 5, tam);
    }

    textFont( fuente2 );
    MiTexto( "Perdiste!", 80, width/2, 200, color ( 54, 191, 252 ) );
    MiTexto( "HAGA CLICK PARA VER LOS\nCREDITOS", 25, width/2, random ( height/2+260, height/2+263 ), color ( 54, 191, 252 ) );
    image( tiste, width/2, height/2, 300, 300);
  }

  //CREDITOS-------------------------------------------------------------

  void dibujarCreditos() {

    //mybeat2.rewind();
    //mybeat2.play();
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
    MiTexto( "PRESIONE LA BARRA ESPACIADORA\nSI QUIERE SALTAR LOS CREDITOS\nY VOLVER A JUGAR", 20, width/2, random ( 717, 720 ), amarillo );
  }

  //REINICIO-------------------------------------------------------

  void reiniciar() {
    estado = "inicio";
    pelota.reiniciar();
    puntaje.punto = 0;

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
  }

  void MiTexto ( String texto, float tam, float x, float y, int MiColor ) {

    pushStyle();
    textAlign( CENTER );
    textSize( tam );
    fill ( MiColor );
    text( texto, x, y );
    popStyle();
  }
}
