/*El juego debe tener:
 
 Una pantalla de instrucciones y créditos.
 Un control para reiniciar el juego.
 
 CONTENIDOS OBLIGATORIOS:
 
 Estructuras repetitivas (ciclos for): simples o anidados.
 Funciones propias con y sin parámetros
 Condicionales (if - else)
 Eventos (mouse y/o teclado)
 Arreglos.
 video
 ----------------------------------------------------------------------------------------------------------------------------------------------------
 */

String estado;
PFont fuente1, fuente2;
PImage calavera, emoji, gatito;
float[] posX, posY;
float tam;//PELOTITA
float vel, velX, velY;
color [][] celda;
int violeta, bordo, rojo, naranja, amarillo;
int cant = 7;
int cant2 = 1000;
int tamRect;
int contadorTiempo;

int puntajeMax;
int puntaje;

void setup() {

  size(600, 800);
  textAlign(CENTER);
  imageMode(CENTER);


  estado = "inicio"; //start, logo, nombre del juego, //--------------------------- MODIFICA ESTADO
  fuente1 = createFont("iomanoid.ttf", 65);
  fuente2 = createFont("pixel.TTF", 20);

  //ESTADO INICIO
  gatito = loadImage("gatito.png");


  //ESTADO INSTRUCCIONES

  //ESTADO JUGANDO
  posX = new float[2];
  posY = new float[2];
  celda = new color [cant][cant];


  tamRect = width/cant;
  for (int x=0; x<cant; x++) {
    for (int y=0; y<cant; y++) {

      celda[x][y] = color(255, random(0, 180), random(50, 100), 220);
    }
  }

  violeta = color(88, 24, 69);
  bordo = color(144, 12, 63);
  rojo = color(199, 0, 57);
  naranja = color(255, 87, 51);
  amarillo = color(255, 195, 15);

  posX[0] = width/2;
  posX[1] = 10;
  posY[0] = height-200;
  posY[1] = height-110;
  tam = 20;
  vel = velX = velY = 1;
  contadorTiempo = 0;

  puntajeMax = 42;
  puntaje = 0;

  //ESTADO PERDER
  calavera = loadImage("Calavera.png");
  //ESTADO GANAT
  emoji = loadImage("emoji.png");


  /*instrucciones, (fondo bordo) preciona la barra espaciadora y move el mouse para golpear la pelota, no la dejes caer! (fondo negro la bajamos la opacidad que se vea el estado jugando de fondo y un rectangulo chiquito con las instrucciones)
   jugando (preciona la barra espaciadora
   ganastae (fondo amarillo)boton que te lleva a creditos (felicitaciones y cuatrados de colores que caen como nieve)
   creditos (fondo naranja)(ver discord)
   perdiste (fondo rojo) lo siento, intentalo de nuevo GAME OVER
   creditos
   */
}

//----------------------------------------------------------------------------------------------------------------------------------------------------

void draw() {
  //ESTADOS:

  if ( estado.equals("inicio") ) {
    inicio();
  } else if ( estado.equals("instrucciones") ) {
    instrucciones();
  } else if ( estado.equals("jugando") ) {
    jugando();
  } else if ( estado.equals("ganaste") ) {
    ganaste();
  } else if ( estado.equals("creditos") ) {
    creditos();
  } else if ( estado.equals("perdiste") ) {
    perdiste();
  } else if ( estado.equals("creditos") ) {
    //"haga click si quiere saltar los creditos y volver a jugar"
    background( 200, 0, 200 );
    text("HAGA CLICK SI QUIERE SALTAR LOS CREDITOS\nY VOLVER A JUGAR", width/2, 35);
  }
}
//----------------------------------------------------------------------------------------------------------------------------------------------------

void mouseClicked() {
  if ( estado.equals("inicio")) {
      estado = "instrucciones";
    }
  if ( estado.equals("instrucciones") && dist(mouseX, mouseY, width/2, height/2+200) <= 50) {
    estado = "jugando";
  } 

  if ( estado.equals("perdiste")) {
    estado = "creditos";
  } 
  if ( estado.equals("ganaste")) {
    estado = "creditos";
  }
}

//-----------------------------------------------------------------------------------------------------------------------------------------------------

void keyPressed() {
  if ( estado.equals("creditos") ) {
    if (keyPressed) {
      if (key == ' ') {
        reiniciar();
      }
    }
  }
}

//-----------------------------------------------------------------------------------------------------------------------------------------------------

void reiniciar() {
  estado = "inicio";
  contadorTiempo = 0;
  frameCount = 0;
  posX[0] = width/2;
  posX[1] = 10;
  posY[0] = height-200;
  posY[1] = height-110;
  tam = 20;
  vel = velX = velY = 1;
  puntaje=0;
  for (int x=0; x<cant; x++) {
    for (int y=0; y<cant; y++) {

      celda[x][y] = color(255, random(0, 180), random(50, 100), 220);
    }
  }
}
