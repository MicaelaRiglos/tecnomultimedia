
void setup(){
  size(600, 600);
}

void draw(){
    noStroke();
    println("x:");
    println(mouseX);
    println("y:");
    println(mouseY);
    
  //fondo 
  background(#C6DDFF);
  
  //arboles
  fill(#1E2013);
  triangle(166,17,1,318,331,318);
  triangle(441,15,316,234,566,234);
  fill(#2B280F);
  triangle(166,17,1,318,125,318);
  triangle(441,15,316,234,400,234);
  //
  fill(#383417);
  triangle(113,116,0,116,0,-100);
  triangle(160,235,0,237,0,-50);
  triangle(295,490,0,490,0,60);
  
  triangle(442,80,389,191,490,191);
  triangle(442,116,321,362,550,362);
  fill(#70683D);
  triangle(442,80,389,191,417,191);
  triangle(432,116,321,362,398,340);
  //
  triangle(503,116,600,116,600,-100);
  triangle(449,237,600,237,600,0);
  triangle(295,520,600,520,600,60);
  
  triangle(95,135,41,268,154,268);
  triangle(95,197,13,370,180,370);
  triangle(95,250,-20,510,230,510);
  
  fill(#8B814A);
  triangle(503,116,550,116,600,-100);
  triangle(449,237,500,237,576,0);
  triangle(295,520,450,520,563,60);
  
  triangle(95,135,41,268,70,268);
  triangle(83,197,13,370,50,370);
  triangle(73,250,-20,510,50,510);
  //
  fill(#968D5A);
  triangle(287,-60,180,170,396,170);
  triangle(287,20,137,322,439,322);
  triangle(287,120,80,486,499,486);
  
  fill(#BFB680);
  triangle(287,-60,180,170,237,170);
  triangle(269,20,137,322,206,322);
  triangle(247,120,80,486,188,486);
  
  //nieve
  fill(#AFAFBB);
  ellipse(300,700,800,550);  
  fill(#E3E4E9);
  ellipse(225,700,650,550); 

  //cuerpo
  fill(#C4C4CC);
  ellipse(300,400,240,190);
  fill(#FAF9F7);
  ellipse(280,400,200,160);
  
  fill(#C4C4CC);
  ellipse(310,280,170,140);
  fill(#FAF9F7);
  ellipse(300,280,150,115);
  
  fill(#C4C4CC);
  ellipse(320,180,120,100);
  fill(#FAF9F7);
  ellipse(313,177,105,85);
  
  //brazos
  strokeJoin(ROUND);
  strokeWeight(9);
  stroke(#96532E);
  line(360,281,369,384);
  line(235,267,166,347);
  line(181,334,182,345);
  line(370,355,378,364);
  strokeWeight(5);
  stroke(#CF8A64);
  line(358,281,367,384);
  line(233,265,164,346);
  line(361,335,350,349);
  
  noStroke();
  //sombrero
  fill(#323744);
  quad(281,91,351,91,349,129,289,139);
  ellipse(318,135,100,20);
  ellipse(316,91,70,20);
  
  fill(#0F0F11);
  quad(289,91,352,91,349,129,295,127);
  ellipse(323,134,93,20);
  ellipse(320,91,63,20);
  
  //botones
  fill(#0F0F11);
  ellipse(297,249,10,10);
  ellipse(285,283,11,11);
  ellipse(282,317,11,11);
  ellipse(275,366,11,11);
  ellipse(270,409,11,11);
  
  fill(#E3E4E9);
  ellipse(295,247,4,3);
  ellipse(283,281,3,4);
  ellipse(280,315,3,4);
  ellipse(273,364,4,3);
  ellipse(268,407,3,4);
  
  //ojos, boca
  fill(#0F0F11);
  ellipse(281,169,10,10);
  ellipse(329,170,11,11);
  
  ellipse(280,193,7,7);
  ellipse(290,198,8,8);
  ellipse(300,199,8,9);
  ellipse(311,199,8,8);
  ellipse(322,197,9,9);
  
  fill(#E3E4E9);
  ellipse(278,169,3,2);
  ellipse(326,170,4,3);
  
  ellipse(278,193,2,2);
  ellipse(288,198,2,2);
  ellipse(298,199,2,2);
  ellipse(309,199,2,2);
  ellipse(320,197,2,2);
  
  //nariz
  fill(#C66C3A);
  ellipse(305,180,17,17);
  triangle(300,172,306,189,280,185);
  
  fill(#F88542);
  ellipse(305,178,15,15);
  triangle(300,172,305,185,282,184);
  
  fill(#FFB569);
  triangle(300,171,301,175,283,183);
}
