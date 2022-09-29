//https://youtu.be/sB_JKhIXd2Q

//PESTANIA PRINCIPAL: declaro objeto

int violeta, rojo, amarillo;
Cancha arkanoid;

//SETUP
void setup() {
  size(600, 600);

  //COLORES
  amarillo = color( 255, 250, 198, 30 ); 
  rojo = color( 199, 0, 57 ); 

  arkanoid = new Cancha(0, 0, color(rojo), color(amarillo), width, height, 10);
}

//DRAW
void draw() {
  arkanoid.dibujar();
}
