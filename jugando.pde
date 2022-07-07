void jugando() {
  //fondo
  pushStyle();
  background(10);
  stroke(199, 0, 57);
  strokeWeight(10);
  fill(violeta);
  rect(0, height-(width+150), width, width+150);
  popStyle();


  if (estado.equals("jugando")) {
    contadorTiempo = frameCount/60;
  }
  println (contadorTiempo);
  println (contadorTiempo/120 );
  textFont(fuente2);
  text("tiempo: "+contadorTiempo, 500, 35);

  if ( contadorTiempo >=  5 * 120 ) {
    estado =  " perder " ;
  }

  noStroke();
  for (int x=0; x<cant; x++) {
    for (int y=0; y<cant; y++) {
      fill(celda[x][y]);
      rect(x*tamRect+8, y*tamRect-87, tamRect-10, tamRect-100);
    }
  }




  //paleta
  noStroke();
  fill(rojo);
  rect(mouseX, height-100, 120, 20);

  //pelota
  fill(amarillo);
  circle(posX[0], posY[0], tam);



  if (posX[0] >= width-13 ) {
    velX = -2;
  }

  if (posX[0] <= 13 ) {
    velX = 2;
  }

  if (posX[0] + 10 > mouseX && posX[0] + 10 < mouseX + 120 && posY[0] > height-100 && posY[0] <  height-100 + 20) {
    velY = -2-vel;
  }

  if (posY[0] <= 70 ) {
    velY = 2+vel;
  }

  if (vel >= 20) {
    vel = 21;
  }

  vel+=0.01; //aumenta la velocidad cada vez que rebota
  posX[0] += velX;
  posY[0] += velY;

  if (posY[0] >= height-13) {
    estado = "perdiste";
  }

  text("puntaje: "+puntaje, 100, 35);

  for ( int x=0; x<cant; x++) {
    for ( int y= 0; y<cant; y++) {
      boolean pum = posX[0] > x*tamRect+8 && posX[0] < x*tamRect+tamRect-10 && posY[0] > y*tamRect-87 && posY[0] < y*tamRect+tamRect-100;      
      if ( pum && celda[x][y] != violeta) {
        celda[x][y] = violeta;
        puntaje += 1;
        velX = -2;
        velX = 2;

        velY = -2-vel;
        velY = 2+vel;
   
      }
    }

    if (puntaje >= puntajeMax) {
      estado = "ganaste";
    }
  }
}
