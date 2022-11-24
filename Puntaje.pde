class Puntaje {

  int punto;

  Puntaje() {

    punto = 0;
  }
  
  void dibujar(){
    
    String texto = " 0";
    texto = ""+nf(punto);
    fill(verde);
    textSize(20);
    text("Puntaje: " + texto, 100, 35);
    
  }
  
  void aumentar(){
    
    punto++;
    
  }
  
}

/* class Puntaje
 
 PROPIEDADES
 punto
 
 CONSTRUCTOR
 se va a conmenzar con 0 puntos
 
 METODOS
 dibujar()
 va a dibujar un string "Puntaje:" + la variable de puntos
 
 aumentar()
 cada vez que un bloque haga "pum" se va a sumar 1 a esa variable
 
 ganar()
 cuando la varia
 
 */
