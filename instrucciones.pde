void instrucciones() {
  background(violeta);
  for ( int i = 0; i < cant; i ++ ) {
    float tam =  random ( 20, 40 );
    noStroke();
    fill(255, random(0, 180), random(50, 100), 70);
    rect ( random(width), random( height ), tam, tam);
  }
  fill(bordo);
  rect(50, 100, 500, 600);
  fill(amarillo);
  textFont(fuente2);

  textSize(40);
  text( estado, width/2, height/2-200 );  
  pushStyle();
  textSize(20);
  text("MUEVE EL MOUSE \nPARA GOLPEAR LA\nPELOTA", width/2, random(height/2-113, height/2-110));
  if ( dist( mouseX, mouseY, width/2, height/2+200) <= 50 ) {
    fill(amarillo);
    ;
    circle( width/2, height/2+200, 100 );
    fill(255, 8, 74);
    text("start", width/2, height/2+206);
  } else {
    fill(255, 8, 74);
    circle( width/2, height/2+200, 100 );
    fill(amarillo);
    text("start", width/2, height/2+206);
  }

  popStyle();
  fill(255, 8, 74);
  textSize(30);
  text("rompe todos\nlos bloques y\nNO LA DEJES\nCAER!", width/2, height/2);

}
