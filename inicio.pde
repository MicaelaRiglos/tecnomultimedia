void inicio() {
  background(violeta); //FONDO
  for ( int i = 0; i < cant; i ++ ) {
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
  // image(pelotita, width/2+5, height/2+10, 200, 200);
  //image(bloques, width/2, height/2, 250, 250);
  fill(amarillo);
  textFont(fuente2);
  text("HAGA CLICK PARA COMENZAR\n EL JUEGO", width/2, random(height/2+200, height/2+210)); //fuente px
  
  image(gatito, width/2, height/2,600,200);
}
