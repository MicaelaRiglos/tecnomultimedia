void MiTexto ( String texto, float tam, float x, float y, int MiColor ) {

  pushStyle();
  textAlign( CENTER );
  textSize( tam );
  fill ( MiColor );
  text( texto, x, y );
  popStyle();
}

//void bloques() { //dibuja los bloques en la pantalla
//  noStroke();
//  for ( int x=0; x<cant; x++ ) {
//    for ( int y=0; y<cant; y++ ) {
//      fill( celda[x][y]);
//      rect( x*tamRect+8, y*tamRect-87, tamRect-10, tamRect-100 );
//    }
//  }
//}
