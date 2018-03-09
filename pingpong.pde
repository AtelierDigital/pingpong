
boolean saqueAlternado = false;
int maxPontos = 5;

int pontosA, pontosB;
int vitoriasA, vitoriasB;

int jogadorSelecionado = 1;
boolean vaiA2 = false;
boolean jogoFinalizado = false;

int cor = 120;
int invert = 1;

PImage logo;
PImage logo2;

void setup(){
  
  pontosA = 0;
  pontosB = 0;
 
  
  size(1024,768);
  
  colorMode(HSB,360,100,100,100);
  textAlign(CENTER);
  noStroke();
  
  logo = loadImage("logoOSitio.png");
  logo2 = loadImage("logoAtelier.png");
}



void draw(){
  
 
  invert = invert%2;
  
  if(jogoFinalizado)  background(0,80,80);
  else if(vaiA2)                background(60,80,80);
  else                     background(120,80,80);
  
  
  fill(0);
  textSize(160);
  text(pontosA, width/4.0, height/2.0);  
  
  rect(width/2.0 - 10, height/3.0, 20, height/3.0);
  text(pontosB, width -width/4.0, height/2.0);
  
  if(pontosA == maxPontos-1 && pontosB == maxPontos-1) vaiA2 = true;
  

  //verificar vencedor
  if(((pontosA == maxPontos || pontosB == maxPontos) && !vaiA2) || ((pontosA > pontosB+1 || pontosB > pontosA+1) && vaiA2)){

    if(pontosA>pontosB) {
      
      if(!jogoFinalizado)vitoriasA++;
      
      fill(360);
      textSize(40);
      text("VENCEDOR", width/4.0, height-height/2.4);
      
    }else{
      
      if(!jogoFinalizado)vitoriasB++;
      
      fill(360);
      textSize(40);
      text("VENCEDOR", width-width/4.0, height-height/2.4);
      
    }
    
    jogoFinalizado = true;
  }
  
  
  textSize(32);
  text("PING PONG", width/2.0, 180);
  
  
  fill(360);
  
  //mostrar saque
  if(jogadorSelecionado==1 && !jogoFinalizado) ellipse(width/4.0, height-height/2.4, 40, 40);
  if(jogadorSelecionado==2 && !jogoFinalizado) ellipse(width-width/4.0, height-height/2.4, 40, 40);
  
  for(int i=0; i<vitoriasA; i++) rect(30+(i*60), 0, 30, 90);
  for(int i=0; i<vitoriasB; i++) rect(width-30-(i*60)-30, 0, 30, 90);
  
  //LOGO
  image(logo,width/2.0-50, 30, 100, 100);
  image(logo2,width/2.0-100, height-240, 200, 200);
  
}


void keyPressed(){
  
  //restart game
  if(key==' ') {
    
   pontosA = 0;
   pontosB = 0; 
   
      if(jogadorSelecionado==2) jogadorSelecionado = 1;
      else jogadorSelecionado = 2;
    
    vaiA2 = false;
    jogoFinalizado = false;
    
  }
  
  if(key=='3') {
    
      if(jogadorSelecionado==2) jogadorSelecionado = 1;
      else jogadorSelecionado = 2;
      
  }
  
  if(key=='4') {
      vitoriasA = 0;
      vitoriasB = 0;
  }
  
  if(jogoFinalizado) return;
  
  if(key=='1') pontosA++;
  if(key=='2') pontosB++;
  
  if(key!='1' && key!='2' ) return;
  
  if(saqueAlternado){
   
    if(key=='1') jogadorSelecionado = 1;
    if(key=='2') jogadorSelecionado = 2;
    
  }else{
    
    if((pontosA+pontosB)%5==0){
      if(jogadorSelecionado==2) jogadorSelecionado = 1;
      else jogadorSelecionado = 2; 
    } 
  }
}