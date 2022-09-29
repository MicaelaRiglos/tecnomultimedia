int violeta, rojo, amarillo;
Cancha arkanoid;

void setup(){
  size(600, 600);
  
  //COLORES
  amarillo = color( 255, 250, 198, 30 ); 
  rojo = color( 199, 0, 57 ); 
  
  arkanoid = new Cancha(0, 0, color(rojo), color(amarillo), width, height, 10);
}

void draw(){
  arkanoid.dibujar();
}


/*

PESTANIA PRINCIPAL: declaro objeto
 bloque 1
 bloque 2
 bloque 3
 
 papleta 1

 pelota 1

SETUP: inicializar objetos
 bloque 1
 bloque 2
 bloque 3
 
 paleta 1
 
 pelota 1

DRAW: dibujar objetos
 bloque 1
 bloque 2
 bloque 3
 
 paleta 1
 
 pelota 1

*/
