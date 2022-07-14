void inicio() {
  
  fondo();

  textFont(fuente1);
  MiTexto( "ARKAND", 100, width/2, 125, amarillo );
  MiTexto( "ARKAND", 100, width/2+2, 127, amarillo );
  MiTexto( "HIT IT HARD", 100, width/2, 205, amarillo );
  MiTexto( "HIT IT HARD", 100, width/2+2, 207, amarillo );

  textFont( fuente2 );
  MiTexto( "HAGA CLICK PARA COMENZAR\nEL JUEGO", 20, width/2, random( height/2+200, height/2+203 ), amarillo);

  MiTexto ( "Victorias: " + victorias + "\nDerrotas: " + derrotas, 25, width/2, 300, amarillo ); //video
  image( gatito, width/2, height/2+70, 600, 200 );

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
