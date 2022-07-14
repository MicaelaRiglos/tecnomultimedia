void contadorDelTiempo( int velT ) {
  contadorTiempo += 1;

  textFont(fuente2);
  text("tiempo: "+contadorTiempo/velT, 500, 35);
}

//----------------------------------------------------------------------------------------------------------------------------------------------------

void score( int puntajeMax ) {
  fill( amarillo );
  if ( puntaje >= puntajeMax ) {
    estado = "ganaste";
  }
  text( "puntaje: "+puntaje, 100, 35 );
}

//----------------------------------------------------------------------------------------------------------------------------------------------------

void bloquesYPelota() {
  //COLICION:

  text( "puntaje: "+puntaje, 100, 35 );

  for ( int x=0; x<cant; x++ ) { //video, utilizan la x e y mas tamRect
  //para delimitar cada bloque asi permitir que la pelota rebote si
  //el color no es violeta, de lo contrario sigue de largo
    for ( int y= 0; y<cant; y++ ) {

      boolean[] pum = new boolean [4]; //arreglo tipo boolean para la colision de la pelota contra los bloque
      pum[0] = posX > x*tamRect-10 && posX < x*tamRect+tamRect+8 && posY > y*tamRect-100 && posY < y*tamRect+tamRect-160;      

      if ( pum[0] && celda[x][y] != violeta ) {
        celda[x][y] = violeta;
        puntaje += 1;
        velY = +1+vel;
      } 

      pum[1] = posX > x*tamRect-10 && posX < x*tamRect+tamRect+8 && posY > y*tamRect-120 && posY < y*tamRect+tamRect-180;

      if ( pum[1] && celda[x][y] != violeta ) {
        celda[x][y] = violeta;
        puntaje += 1;
        velY = -1-vel;
      }

      pum[2] = posX > x*tamRect-14 && posX < x*tamRect+tamRect+12 && posY > y*tamRect-100 && posY < y*tamRect+tamRect-160;

      if ( pum[2] && celda[x][y] != violeta ) {
        celda[x][y] = violeta;
        puntaje += 1;
        velX = -2;
      }
      pum[3] = posX > x*tamRect-14 && posX < x*tamRect+tamRect+12 && posY > y*tamRect-100 && posY < y*tamRect+tamRect-160;

      if ( pum[3] && celda[x][y] != violeta ) {
        celda[x][y] = violeta;
        puntaje += 1;
        velX = 2;
      }
    }
  }
}

//----------------------------------------------------------------------------------------------------------------------------------------------------

void bloques() { //dibuja los bloques en la pantalla
  noStroke();
  for ( int x=0; x<cant; x++ ) {
    for ( int y=0; y<cant; y++ ) {
      fill( celda[x][y]);
      rect( x*tamRect+8, y*tamRect-87, tamRect-10, tamRect-100 );
    }
  }
}

//----------------------------------------------------------------------------------------------------------------------------------------------------

void pelotaYPaleta() {
  //paleta, video, movemos el mouse para no dejar caer la pelota 
  noStroke();
  fill(rojo);
  rect( mouseX, height-100, 120, 20 );

  //pelota, video, cuando colisiona modifica las variables, posX y posY
  fill( amarillo );
  circle( posX, posY, tam );

  //pelota rebota, video, delimitamos con condicionales las paredes, paleta y bloques
  // video, si posX o posY son mayores o iguales ">=" al limite comienzan a restarse
  if ( posX >= width-13 ) {
    velX = -2;
  }
//video, si posX o posY son menores o iguales "<=" al limite comienzan a sumarse
  if ( posX <= 13 ) {
    velX = 2;
  }
//video, delimitando la paleta para que rebote contra ella
  if ( posX + 10 > mouseX && posX + 10 < mouseX + 120 && posY > height-100 && posY <  height-100 + 20 ) {
    velY = -2-vel;
  }

  if ( posY <= 70 ) {
    velY = 2+vel;
  }

  if ( vel >= 19 ) {
    vel = 20;
  }

  vel+=0.01; //aumenta la velocidad cada vez que rebota
  posX += velX;
  posY += velY;

  if ( posY >= height-13 ) { //si la pelota toca la base, perdes
    estado = "perdiste";
  }
}
