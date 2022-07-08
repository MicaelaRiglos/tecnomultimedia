void inicio() {
  background(violeta); //FONDO
  for ( int i = 0; i < cant; i ++ ) { //video, fondo de pantalla de inicio e instrucciones
    float tam =  random ( 20, 40 );
    noStroke();
    fill(255, random(0, 180), random(50, 100), 70);
    rect ( random(width), random( height ), tam, tam);
  }

  fill(amarillo);

  fill(amarillo); //TEXTO
  textFont(fuente1, 100);
  text("ARKAND", width/2, 125);
  text("ARKAND", width/2+2, 127);
  text("HIT IT HARD", width/2, 205);
  text("HIT IT HARD", width/2+2, 207);
  pushStyle();

  popStyle();
  fill(amarillo);
  textFont(fuente2);
  text("HAGA CLICK PARA COMENZAR\nEL JUEGO", width/2, random(height/2+200, height/2+203)); //fuente px
  
  victoriasDerrotas(); //video
  image(gatito, width/2, height/2+70,600,200);
  
  //video, boton de comenzar, cambia de color si esta dentro o fuera de los limites
  //video, si hacemos click dentro de los limites pasamos al estado de instrucciones
  if ( mouseX > width/2-100 && mouseX < width/2+70 && mouseY > height-120 && mouseY < height-50) {
    fill(amarillo);
    rect(width/2-100, height-120, 200, 70);
    fill(255, 8, 74);
    text("COMENZAR", width/2, height-75);
  } else {
    fill(255, 8, 74);
    rect(width/2-100, height-120, 200, 70);
    fill(amarillo);
    text("COMENZAR", width/2, height-75);
  }
}

void victoriasDerrotas() {
  textFont(fuente2, 25);
  text("Victorias: " + victorias + "\nDerrotas: " + derrotas, width/2, 300);
}
