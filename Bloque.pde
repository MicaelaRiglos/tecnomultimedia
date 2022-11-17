class Bloque {

  int x, y;

  Bloque(int x, int y) {
    this.x = x;
    this.y = y; 
   //this.pum = pum;
   
   
  }
  
  void dibujar(){
    
    pushStyle();
    noStroke();
   //if(pum == 1){
    rect(x, y, 85, 30);
    popStyle();
  }
  
  void romper(){
    
    
  }
  }


/* class Bloque
 
 PROPIEDADES
 posicion, tamanio, color
 
 CONSTRUCTOR
 defino por parametros la posicion de x e y 
 de tamanio
 y de color
 
 METODOS
 dibujar()
 va a dibujar un rect en las cordenadas de x e y con su determinado tamanio y color
 
 pum()
 //agregar un boolean para ver si colisiona
 cuando la pelota colisione con el bloque, este va a romperse modofocar el color
 */
