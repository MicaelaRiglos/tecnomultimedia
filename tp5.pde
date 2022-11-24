import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioPlayer pop;


int verdeclaro, verde, turquesa, azul, azulmarino;
//int victorias, derrotas;

//int tamRect; //BLOQUES
//int cant = 7; //BLOQUES
//color [][] celda; //BLOQUES

Juego juego;
void setup() {
   
  minim = new Minim(this);
  juego = new Juego();
  player = minim.loadFile("mybeat.wav");
 

  size( 600, 800 );
  textAlign( CENTER );
  imageMode( CENTER );

  //COLORES
  verdeclaro = color( 217, 237, 146 );
  verde = color( 181, 228, 140 );
  //verde = color( 118, 200, 147 );
  turquesa = color( 52, 160, 164 );
  azul = color( 26, 117, 159 );
  azulmarino = color( 24, 78, 119 );



  //VICTORIAS Y DERROTAS
  //victorias = derrotas = 0;

  //  celda = new color [cant][cant];

  //  tamRect = width/cant;
  //  for ( int x=0; x<cant; x++ ) { //pinta de un color aleatorio los bloques, esta en el setup para que solo se pinten una vez
  //    for (int y=0; y<cant; y++) {

  //      celda[x][y] = color( random( 130, 140 ), random (200, 255), random (150, 250) );
  //    }
  //  }
}

void draw() {

  juego.dibujar();
  //player.play();

  //disenio jugando
  /* pushStyle();
   background(10);
   stroke(verde);
   strokeWeight(10);
   fill(azulmarino);
   rect(0, height-(width+150), width, width+150);
   popStyle();
   
   bloques();*/


  //inicio
  /*background(azulmarino);
   MiTexto( "ARKAND", 100, width/2, 125, verdeclaro );
   MiTexto( "ARKAND", 100, width/2+2, 127, verdeclaro );
   MiTexto( "HIT IT HARD", 100, width/2, 205, verdeclaro );
   MiTexto( "HIT IT HARD", 100, width/2+2, 207, verdeclaro );
   
   MiTexto( "HAGA CLICK PARA COMENZAR\nEL JUEGO", 20, width/2, random( height/2+200, height/2+203 ), verdeclaro);
   
   MiTexto ( "Victorias: " + victorias + "\nDerrotas: " + derrotas, 25, width/2, 300, verdeclaro ); //video
   //image( gatito, width/2, height/2+70, 600, 200 );
   
   //video, boton de comenzar, cambia de color si esta dentro o fuera de los limites
   //video, si hacemos click dentro de los limites pasamos al estado de instrucciones
   if ( mouseX > width/2-100 && mouseX < width/2+70 && mouseY > height-120 && mouseY < height-50 ) {
   fill( verdeclaro );
   rect( width/2-100, height-120, 200, 70 );
   MiTexto( "COMENZAR", 20, width/2, height-75, color ( 255, 8, 74 ) );
   } else {
   fill( 255, 8, 74 );
   rect( width/2-100, height-120, 200, 70 );
   MiTexto( "COMENZAR", 20, width/2, height-75, verdeclaro );
   }*/
}


/*void keyPressed() {
  if (player.isPlaying() ) {
    player.pause();
  } else {
    player.play();
  }
}*/

  void mouseMoved() {
    juego.mouseMoved();
  }
  void mouseClicked() {
    juego.mouseClicked();
    println(juego.estado);
  }



  /* pestania principal: 
   
   declarar objeto
   juego Arkanoid;
   
   setup: inicializar el objeto arkanoid
   
   draw: dibujar los metodos de arkanoid
   dibujar()
   
   mouseMoved:
   mouseMoved()
   mouseClicked:
   mouseClicked()
   */
