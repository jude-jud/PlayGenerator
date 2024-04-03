enum states{
  mainMenu,
  question1,
  question2,
  question3,
  question4,
  question5,
  question6,
  question7,
  aQuestion1,
  aQuestion2,
  aQuestion3,
  aQuestion4,
  aQuestion5,
  aQuestion6,
  aQuestion7,
  aQuestion8,
  aQuestion9,
  aQuestion10,
  generate,
  plays
}
states currentState = states.mainMenu;
Player p;
Team t;
Button resetB,start,adv;
Questionnaire q;
boolean mouseDown,advM;
void setup(){
  size(800,800);
  q = new Questionnaire();
  p = new Player(400,400);
  t = new Team();  
  resetB= new Button(630,20,150,80,"Reset");
  start = new Button(325,400,150,80,"Start");
  adv = new Button(363,500,75,40,"Adv.");
}

void draw(){
  background(144,238,144);
  switch(currentState){
    case mainMenu:
      fill(0);
      textAlign(CENTER,CENTER);
      textSize(50);
      text("Play Generator",400,300);
      start.show();
      textSize(25);
      adv.show();
      if(start.clicked()){
         currentState=states.question1;
      }
      if(adv.clicked()){
        advM = true;
         currentState=states.aQuestion1;
      }
    break;
    case question1:
      q.showQ1();
    break;
    case question2:
      q.showQ2();
    break;
    case question3:
      q.showQ3();
    break;
    case question4:
      q.showQ4();
    break;
    case question5:
      q.showQ5();
    break;
    case question6:
      q.showQ6();
    break;
    case question7:
      q.showQ7();
    break;
    case generate:
      //finish this
      if(q.answers[0]=="Trips"){
        t.trips();
      }
      if(q.answers[0]=="Twins"){
        t.twins();
      }
      if(q.answers[0]=="21 Personnel"){
        t.twentyOnePersonnel();
      }
      if(q.answers[0]=="Pro Set"){
        t.proSet();
      }
      if(q.answers[0]=="Singleback"){
        t.singleback();
      }
      if(q.answers[0]=="Power I"){
        t.iFormation();
      }
      if(q.answers[0]=="T Formation"){
        t.tFormation();
      }
      if(q.answers[0]=="Shotgun"){
        t.shotgun();
      }
      if(q.answers[0]=="Pistol"){
        t.pistol();
      }
      if(q.answers[0]=="Wing T"){
        t.wingT();
      }
      if(q.answers[0]=="Slot T"){
        t.slotT();
      }
      if(q.answers[0]=="Double Wing"){
        t.doubleWing();
      }
      //check if advanced mode was used
      //
      if(advM == true){
        t.applyAtr();
      }
      currentState=states.plays;
      
    break;
    case plays:
      t.show();
      resetB.show();
      if(resetB.clicked()){
         t.reset();
         currentState=states.mainMenu;
      }
    break;
  }
  
   mouseDown=false;
}
void mouseClicked(){
  mouseDown = true;
}
