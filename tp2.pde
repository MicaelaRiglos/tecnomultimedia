// https://youtu.be/SMm4BZSlqaA //<>//

float x, y, vel;

void setup() {
  size(600, 600); //se adapta a cualquier tamanio de pantalla gracias al uso de width y height
  noStroke();
  x = width / 2;  //cambio origen de coordenadas
  y = height / 2;
  vel = 1; //velocidad de la flor de circulos
}

void draw() {

  circulosConcentricos(width/100*10, 10);


  florEllipses();

  //circulo color
  fill(map(mouseX, 0, width, 0, 255), 0, 173); //rellena el circulo entre rojo y azul con el movimiento de mouseX
  circle(x, y, width/4);

  florCiculos();

  //circulito blanco en el centro
  fill(255, 255, 255, 200); 
  stroke(10);
  circle(x, y, width/30);

  //circulo negro en el centro que tapa
  if (mouseX == 0 && mouseY == 0) {
    fill(10);
    circle(x, y, width/3.9);
  }
}

//-FUNCIONES------------------------------------------------------------------------------------------------------------------------------------------------------------

void circulosConcentricos(float cant, float tam) {  //cant modifica la cantidad de circulos
  background(0);
  for (int i=0; i<cant; i++) { //ciclo for de circulos
    if (i%2==0) { //rellena de negro los pares
      fill(0);
    } else {
      fill( random(100, 200), 0, random(100, 200)); //rellena de un color random entre rojo y azul los impares
    }
    float radio = (width*2)-i*tam; //tam modifica el radio de los circulos con en indice
    circle(x, y, radio);
  }
}


void florEllipses() {
  for (int i=0; i<mouseY; i+=10) { //aumenta la cantidad de ellipses con el movimiento de mouseY
    stroke(10);

    pushMatrix(); //abro la posibilidad de rotaciones y traslaciones
    translate( x, y );  //cambio origen de coordenadas
    rotate( radians(i+mouseX) );  //roto las ellipses incrementando i con el movimiento de mouseX

    fill(255, 255, 255, 20); //relleno modificando Alpha
    noStroke();
    ellipse(0, 0, width/5, height-height/5); 
    noFill(); 
    stroke(10);
    ellipse(0, 0, width/20, height);
    ellipse(0, 0, width/5, height);

    popMatrix(); //cierro y vuelvo el origend e coordenadas al punto (0,0);
  }
}


void florCiculos() {
  for (int i=0; i<600; i+=17) { //i espacio de los circulos
    pushMatrix(); //abro la posibilidad de rotaciones y traslaciones
    translate( x, y );  //cambio origen de coordenadas
    rotate( radians(i+frameCount*vel) ); //multiplico el frameCount para que vaya mas rapido 

    fill(255, 255, 255, 10); //relleno modificando Alpha
    circle(width/20, width/20, width/9); //tamanio de circulos que se adapten a cualquier tamanio de pantalla

    popMatrix();
  }
}


void keyPressed() {

  if (key == 'R' || key == 'r') { 
    reiniciar();
  }
}


void mousePressed() { //
  vel++;
}


void reiniciar() {
  frameCount= 0;
  vel= 1;
  mouseX= 0;
  mouseY= 0;
}
