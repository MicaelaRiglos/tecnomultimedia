void jugando() {
  //fondo
  pushStyle();
  background(10);
  stroke(199, 0, 57);
  strokeWeight(10);
  fill(violeta);
  rect(0, height-(width+150), width, width+150);
  popStyle();


  contadorDelTiempo(50);//modifica la vel
  score(35);//bloques se rompen y se suma el puntaje//modifica el puntaje maximo para ganar
  bloques();
  pelotaYPaleta();
  bloquesYPelota();
}
