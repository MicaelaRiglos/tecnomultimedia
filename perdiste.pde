void perdiste(){
  //AGREGAR EL SCORE
    background( rojo );
    fill(10);
    textFont(fuente2, 100);
    text("GAME\nOVER!", width/2, 200);
    textFont(fuente2, 25);
    text("HAGA CLICK PARA VER LOS\nCREDITOS", width/2, random (height/2+250, height/2+260));
    
    image(calavera, width/2, height/2+80, 200, 200);
}
