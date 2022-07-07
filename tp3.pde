
String estado;
PFont fuente1, fuente2;
PImage calavera, emoji, gatito;
float posX, posY;
float tam;//PELOTITA
float vel, velX, velY;
color [][] celda;
int violeta, bordo, rojo, naranja, amarillo;
int cant = 7; //BLOQUES
int cant2 = 1000; ///DECORACION
int tamRect; //BLOQUES
int contadorTiempo;
int puntaje;
int victorias, derrotas;

void setup() {

  size(600, 800);
  textAlign(CENTER);
  imageMode(CENTER);


  estado = "inicio";
  fuente1 = createFont("iomanoid.ttf", 65);
  fuente2 = createFont("pixel.TTF", 20);

  //ESTADO INICIO
  gatito = loadImage("gatito.png");

  //ESTADO JUGANDO
  celda = new color [cant][cant];



  tamRect = width/cant;
  for (int x=0; x<cant; x++) {
    for (int y=0; y<cant; y++) {

      celda[x][y] = color(255, random(0, 180), random(50, 100), 220);
    }
  }

  //COLORES
  violeta = color(88, 24, 69);
  bordo = color(144, 12, 63);
  rojo = color(199, 0, 57);
  naranja = color(255, 87, 51);
  amarillo = color(255, 195, 15);

  //PELOTA
  posX = random(width);
  posY = height-200;
  tam = 20;
  vel = velX = velY = 1;

  //TIEMPO Y PUNTAJE
  contadorTiempo = 0;
  puntaje = 0;

  //VICTORIAS Y DERROTAS
  victorias = derrotas = 0;

  //ESTADO PERDISTE
  calavera = loadImage("Calavera.png");
  //ESTADO GANASTE
  emoji = loadImage("emoji.png");
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
  }
}
//----------------------------------------------------------------------------------------------------------------------------------------------------

void mouseClicked() {
  if ( estado.equals("inicio") && mouseX > width/2-100 && mouseX < width/2+100 && mouseY > height-120 && mouseY < height-50) {
    estado = "instrucciones";
  }
  if ( estado.equals("instrucciones") && dist(mouseX, mouseY, width/2, height/2+200) <= 50) {
    estado = "jugando";
  } 

  if ( estado.equals("perdiste")) {
    estado = "creditos";
    derrotas++;
  } 
  if ( estado.equals("ganaste")) {
    estado = "creditos";
    victorias++;
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
  posX = random(width);
  posY = height-200;
  tam = 20;
  vel = velX = velY = 1;
  puntaje=0;
  for (int x=0; x<cant; x++) {
    for (int y=0; y<cant; y++) {

      celda[x][y] = color(255, random(0, 180), random(50, 100), 220);
    }
  }
}
