PImage dinosauriosBebes, sid;
PFont letrita ;
float tam, tam2, tam3;
float x1, y1, x2, y2, x3, y3, x4, y4, x5, y5 ;
float x6, y6, x7, y7, x8, y8, x9, y9, x10, y10 ;
float x11, y11, x12, y12, x13, y13, x14, y14 ;
float x15, y15, x16, y16, x17, y17, x18, y18, x19, y19 ;
color a2, a3, a6, a7, a8, a19; //a = alpha

void setup() {
  size(800, 400) ;
  textAlign(CENTER, CENTER) ;
  letrita = createFont("Spongeboy Me Bob.ttf", 20);
  dinosauriosBebes = loadImage("dinosaurios_bebess.jpg");
  sid = loadImage("Sid.png");

  //tamanio Sid
  tam = 100;
  //tamanio letras
  tam2 =  30;
  tam3 =  5;

  //coordenadas
  x1 = -110 ;  
  y1 = 200 ;

  x2 = 200 ;
  y2 = -30 ;

  x3 = 470 ;
  y3 = 200 ;

  x4 = -110 ;  
  y4 = 120 ;

  x5 = 400 ;  
  y5 = -50 ;

  x6 = -115 ;  
  y6 = 120 ;

  x7 = 200;
  y7 = 200;

  x8 = 200;
  y8 = 300;

  x9 = x10 = x11 = -125 ;
  y9 = y10 = y11 = 300 ;

  x12 = x19 = 400;
  y12 = 500;

  x13 = x15 = x17 = 890;
  y13 = y15 = y17 = 340;

  x14 = x16 = -120;
  y14 = y16 = 340;

  x18 = 600;
  y18 = y19 = -110;

  //opacidad de textos
  a2 = a6 = a19 = 255 ;
  a3 = a7 = a8 = 0 ;
}



void draw() { 


  println("x");
  println(mouseX);
  println("y");
  println(mouseY);
  println( frameCount, frameCount/30 );


  background(0);
  image(dinosauriosBebes, 0, 0, 800, 400);
  noCursor();
  if (mousePressed == true) {
    tam = random(100, 400);
  }
  image(sid, mouseX, mouseY, tam, tam+10);
  textFont(letrita, 20);

  fill(255, 255, 255);
  text("DIRECTED BY\nCARLOS SALDANAHA", x1, y1);

  fill(255, 255, 255, a2);
  text("CO-DIRECTED BY\nMICHAEL THURMEIER", x2, y2);

  fill(255, 255, 255, a3);
  text("PRODUCED BY\nLORI FORTE\nJOHN C. DONKIN", x3, y3);

  fill(255, 255, 255);
  text("EXECUTIVE PRODUCER\nCHRIS WEDGE", x4, y4);

  fill(255, 255, 255);
  text("SCREENPLAY BY\nMICHAEL BERG & PETER ACKERMAN\nAND MIKE REISS\nAND YONI BRENNER", x5, y5);

  fill(255, 255, 255, a6);
  text("STORY BY\nJASON CARTER EATON", x6, y6);

  fill(255, 255, 255, a7);
  text("MUSIC BY\nJOHN POWELL", x7, y7);

  fill(255, 255, 255, a8);
  text("CHARACTERS DESIGNED BY\nPETER DE SEVE", x8, y8);

  fill(255, 255, 255);
  text("ART DIRECTOR\nMICHAEL KNAPP", x9, y9);
  text("EDITED BY\nHARRY HITNER", x10, y10);
  text("CASTING BY\nCHRISTIAN KAPLAN, CSA", x11, y11);

  textSize(tam2);
  fill(255, 255, 255);
  text("RAY ROMANO", x12, y12);

  textSize(20);
  fill(255, 255, 255);
  text("JOHN LEGUIZAMO", x13, y13);
  text("DENIS LEARY", x14, y14);
  text("SIMON PEGG", x15, y15);
  text("SEANN WILLIAM SCOTT", x16, y16);
  text("JOSH PECK", x17, y17);
  text("AND\nQUEEN LATIFAH", x18, y18);

  fill(255, 255, 255, a19);
  textSize(tam3);
  text("BILL HACER\nKRISTEN WIIG", x19, y19);


  //movimiento T1 derecha
  if (x1 < 200) 
    x1+=2;

  //movimiento T1 abajo
  if (x1 == 200) 
    y1+=10;


  //movimiento T2 abajo y frena en el medio
  if (x1 == 200 && y2 <= 200)
    y2+=10;

  //movimiento T2 derecha
  if (y2 >= 200) 
    x2+=2;

  if (x2 > 450) 
    a2 -= 10;

  //movimiento T3 derecha
  if (x2 > 470 && x2 < 600) {
    x3+=2;
    a3+=10;
  } else if ( x2 > 600) {
    a3-=15;
  }

  //movimiento T4 derecha
  if (a3 < 50 && a2 < 1)
    x4+=2;

  if ( x4 >= 200)
    x4+=20;

  //movimiento T5 abajo y frena
  if (x4 > 810 && y5 <= 100)
    y5+=2;

  //movimiento T5 derecha
  if (y5 >= 100) 
    x5+=20;

  //movimiento T6 derecha
  if (x5 > 800 && x6 < 200) 
    x6+=10;

  //movimiento T6 abajo
  if (x6 > 200) 
    y6+=2;

  if (y6 > 200) 
    a6 -= 10;

  //movimiento T7 abajo
  if (y6 > 200 && y7 < 300) {
    y7+=2;
    a7+=10;
  } else if ( y7 >= 300) {
    a7-=10;
  }

  //movimiento T8 derecha
  if (y7 >= 300 && a7 < 0 && x8 < 600) {
    x8+=12;
    a8+=15;
  } else if ( x8 >= 600) {
    a8-=6;
  }

  //movimiento T9 derecha
  if (a8 < 200 &&  x8 >= 600)
    x9+=2;

  //movimmiento T10 derecha
  if (x9 > 400)
    x10+=2;

  //movimiento T11 derecha
  if (x10 > 400 && x11 < 400)
    x11+=2;

  //movimiento T11 abajo
  if (x11 > 400)
    y11+=12;

  //movimiento T12 arriba, frena, abajo
  if (y11 >= 450 && frameCount/30 <= 58) {
    y12-=10;
  }
  if (frameCount/30 > 58 && frameCount/30 < 59) {
    y12 = 280;
  } else if (frameCount/30 > 59 && y12 < 500) {
    y12+=10;
    tam2--;
  }

  //movimiento T13 izquierda
  if (frameCount/30 > 63 && x13 > 400)
    x13-=4;

  //movimiento T13 abajo
  if (x13 <= 400)
    y13+=20;

  //movimiento T14 derecha
  if (y13 > 400 && x14 < 400)
    x14+=4;

  //movimiento T14 abajo
  if (x14 >= 400)
    y14+=20;

  //movimiento T15 izquierda
  if (x14 >= 400 && x15 > 400)
    x15-=4;

  //movimiento T15 abajo
  if (x15 <= 400)
    y15+=20;

  //movimiento T16 derecha
  if (y15 > 400 && x16 < 400)
    x16+=4;

  //movimiento T16 abajo
  if (x16 >= 400)
    y16+=20;

  //movimiento T17 izquierda
  if (x16 >= 400 && x17 > 400)
    x17-=4;

  //movimiento T17 abajo
  if (x17 <= 400)
    y17+=20;

  //movimiento T18 abajo, frena y arriba
  if (y17 > 400 && frameCount < 2571) {
    y18+=20;
  } 
  if (frameCount > 2571 && frameCount < 2622) {
    y18 = 250;
  } else if (frameCount >= 2622) {
    y18-=30;
  }

  //movimiento T19 abajo y desaparece
  if (y18 < -110 && y19 < 250) 
    y19+=15;
  if (y19 >= 250) {
    tam3+= 0.5;
    a19--;
  }
}
