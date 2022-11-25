class Puntaje {

  int punto;

  Puntaje() {
    this.punto = 0;
  }
  
  void dibujar(){
    String texto = " 0";
    texto = ""+nf(this.punto);
    fill(255, 195, 15);
    textSize(20);
    text("Puntaje: " + texto, 100, 35);
  }
  
  void aumentar(){
    this.punto++;
  }
  
}
