void ganaste(){
  background( naranja );
    fill(10);
    textFont(fuente2, 100);
    text("YOU\nWIN!", width/2, 200);
    textFont(fuente2, 25);
    text("HAGA CLICK PARA VER LOS\nCREDITOS", width/2, random (height/2+260, height/2+263));
    fill(255);
    circle(width/2+15, height/2+80, 100);
    image(emoji, width/2+15, height/2+80, 400, 400);
}
