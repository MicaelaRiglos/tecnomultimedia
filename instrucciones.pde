void instrucciones() {
  
  fondo();
  
  fill( bordo );
  rect( 50, 100, 500, 600 );

  textFont( fuente2 );
  MiTexto( estado, 40, width/2, height/2-200, amarillo );
  MiTexto( "MUEVE EL MOUSE \nPARA GOLPEAR LA\nPELOTA", 20, width/2, random( height/2-113, height/2-110 ), amarillo );
  if ( dist( mouseX, mouseY, width/2, height/2+200) <= 50 ) {
    fill( amarillo );
    circle( width/2, height/2+200, 100 );
    MiTexto( "start", 20, width/2, height/2+206, color ( 255, 8, 74 ) );
  } else {
    fill( 255, 8, 74 );
    circle( width/2, height/2+200, 100 );
    MiTexto( "start", 20, width/2, height/2+206, amarillo );
  }

  MiTexto( "rompe todos\nlos bloques y\nNO LA DEJES\nCAER!", 30, width/2, height/2, color ( 255, 8, 74 ) );
}
