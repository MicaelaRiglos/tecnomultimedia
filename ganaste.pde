void ganaste() {
  background( naranja );
  textFont( fuente2 );
  MiTexto( "YOU\nWIN!", 100, width/2, 200, color ( 10 ) );
  MiTexto( "HAGA CLICK PARA VER LOS\nCREDITOS", 25, width/2, random ( height/2+260, height/2+263 ), color ( 10 ) );

  fill( 255 );
  circle( width/2+15, height/2+80, 100 );
  image( emoji, width/2+15, height/2+80, 400, 400 );
}
