import controlP5.*;
import java.net.*;

ControlP5 controlP5;
Button incrementationButton;
Button decrementationButton;
Textfield chaineText;

int begin=0; 
int duration = 0;
int time = 0;

int h=0; //Heure conversion
int m=0; //Minute conversion
int s=0; //Seconde conversion

int entreePlus=0;
int entreeMoins=0;
int chaineEnvoi=0;


void setup() {
  size(500, 210); 
  noStroke();
  controlP5 = new ControlP5(this);
  incrementationButton=controlP5.addButton("IncrementationButton")
     .setValue(1)
     .setPosition(10,150)
     .setSize(200, 50)
     .setLabelVisible(true)
     .setFont(createFont("arial", 20))
     .setLabel("INCREMENTATION")
     .setColorActive(color(255,0,0))
     .setColorForeground(color(0,255,255))
     .updateSize()
     ;
  
  decrementationButton=controlP5.addButton("DecrementationButton")
     .setValue(1)
     .setPosition(230,150)
     .setSize(200, 50)
     .setLabelVisible(true)
     .setFont(createFont("arial", 20))
     .setLabel("DECREMENTATION")
     .setColorActive(color(255,0,0))
     .setColorForeground(color(0,255,255))
     .updateSize()
     ;
  
  chaineText=controlP5.addTextfield("cheminText")
    .setPosition(10, 90)
    .setSize(150,30)
    .setFont(createFont("arial", 20))
    .setAutoClear(false)
    .setValue(chaineEnvoi)
    .setLabelVisible(true)
    .setLabel("+/- min")
    .setColorActive(color(255,0,0))
    .setColorForeground(color(0,255,255))
  ;
  
  begin = millis();
}

void draw() {
  background(0);

    if(entreePlus>0)
    {
      duration=+ duration + entreePlus*60 ;
      entreePlus=0;
    }
    
    if(entreePlus<0)
    {
      duration= duration + entreePlus*60 ;
      entreePlus=0;
    }
    
    if(entreeMoins>0)
    {
      duration= duration - entreeMoins*60 ;
      entreeMoins=0;
    }
    
    if(entreeMoins<0)
    {
      duration= duration - entreeMoins*60 ;
      entreeMoins=0;
      
    }
    
      time = duration + (millis() - begin)/1000;
      m=time/60;
      s=time-m*60;
      textSize(32);
      text("Temps en s : ", 10, 40);
      text(time, 280, 40);
      text("Temps restant : ", 10, 80);
      text(m, 260, 80);
      text(" min ", 305, 80);
      text(s, 375, 80);
      text(" s ",420, 80);
  if(time<0)
  {
    text("Fin du temps", 170, 115);
  }
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
}

public void IncrementationButton() { // fonction évènement Button de meme nom - reçoit la valeur

        println("Evènement IncrementationButton");
        print("Envoi de la chaine :");
        print(chaineText.getText()+"\n");
        entreePlus=int(chaineText.getText());
} // fin evènement bouton envoi

public void DecrementationButton() { // fonction évènement Button de meme nom - reçoit la valeur

        println("Evènement IncrementationButton");
        print("Envoi de la chaine :");
        print(chaineText.getText()+"\n");
        entreeMoins=int(chaineText.getText());
} // fin evènement bouton envoi

public void chaineText(int theText) { // fonction évènement Textfield de meme nom - déclenché par return - reçoit la chaine

        println("Evènement CheminText avec valeur = "+theText);

        chaineEnvoi=theText; // mémorise le contenu du champ

        println("Le chemin est :"+chaineEnvoi);

} // fin evènement champ texte chemin fichier