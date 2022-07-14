void MiTexto ( String texto, float tam, float x, float y, int MiColor ) {

  pushStyle();
  textAlign( CENTER );
  textSize( tam );
  fill ( MiColor );
  text( texto, x, y );
  popStyle();
}

//----------------------------------------------------------------------------------------------------------------------------------------------------

void fondo(){
  background( violeta ); //FONDO
  for ( int i = 0; i < cant; i ++ ) { //video, fondo de pantalla de inicio e instrucciones
    float tam =  random ( 20, 40 );
    noStroke();
    fill(255, random( 0, 180 ), random( 50, 100 ), 70);
    rect ( random(width), random( height ), tam, tam);
  }
}
