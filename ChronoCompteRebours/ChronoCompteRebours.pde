import controlP5.*;
import java.net.*;

ControlP5 controlP5;
Button incrementation_minButton;
Button decrementation_minButton;
Textfield chaine_minText;

Button pauseButton;
Button restartButton;
Textfield chaine_Text;

Button incrementation_secButton;
Button decrementation_secButton;
Textfield chaine_secText;

int begin=0; 
int duration = 0;
int time = 0;

int h=0; //Heure conversion
int m=0; //Minute conversion
int s=0; //Seconde conversion

int entreePlusMin=0;
int entreeMoinsMin=0;
int entreePlusSec=0;
int entreeMoinsSec=0;
int chaineEnvoi=0;

boolean pause=false;
int savetime=0;
int loadtime=0;
boolean depause=true;
boolean restart=false;

void setup() {
  size(590, 400); 
  noStroke();
  controlP5 = new ControlP5(this);
  incrementation_minButton=controlP5.addButton("Incrementation_minButton")
     .setValue(1)
     .setPosition(170,150)
     .setSize(200, 50)
     .setLabelVisible(true)
     .setFont(createFont("arial", 20))
     .setLabel("INCREMENTATION")
     .setColorActive(color(255,0,0))
     .setColorForeground(color(0,255,255))
     .updateSize()
     ;
  
  decrementation_minButton=controlP5.addButton("Decrementation_minButton")
     .setValue(1)
     .setPosition(380,150)
     .setSize(200, 50)
     .setLabelVisible(true)
     .setFont(createFont("arial", 20))
     .setLabel("DECREMENTATION")
     .setColorActive(color(255,0,0))
     .setColorForeground(color(0,255,255))
     .updateSize()
     ;
  
  chaine_minText=controlP5.addTextfield("cheminminText")
    .setPosition(10, 150)
    .setSize(150,30)
    .setFont(createFont("arial", 20))
    .setAutoClear(false)
    .setValue(chaineEnvoi)
    .setLabelVisible(true)
    .setLabel("+/- min")
    .setColorActive(color(255,0,0))
    .setColorForeground(color(0,255,255))
  ;
  
  incrementation_secButton=controlP5.addButton("Incrementation_secButton")
     .setValue(1)
     .setPosition(170,210)
     .setSize(200, 50)
     .setLabelVisible(true)
     .setFont(createFont("arial", 20))
     .setLabel("INCREMENTATION")
     .setColorActive(color(255,0,0))
     .setColorForeground(color(0,255,255))
     .updateSize()
     ;
  
  decrementation_secButton=controlP5.addButton("Decrementation_secButton")
     .setValue(1)
     .setPosition(380,210)
     .setSize(200, 50)
     .setLabelVisible(true)
     .setFont(createFont("arial", 20))
     .setLabel("DECREMENTATION")
     .setColorActive(color(255,0,0))
     .setColorForeground(color(0,255,255))
     .updateSize()
     ;
  
  chaine_secText=controlP5.addTextfield("chemin_secText")
    .setPosition(10, 210)
    .setSize(150,30)
    .setFont(createFont("arial", 20))
    .setAutoClear(false)
    .setValue(chaineEnvoi)
    .setLabelVisible(true)
    .setLabel("+/- sec")
    .setColorActive(color(255,0,0))
    .setColorForeground(color(0,255,255))
  ;
  
  pauseButton=controlP5.addButton("PauseButton")
     .setValue(1)
     .setPosition(470,10)
     .setSize(100, 50)
     .setLabelVisible(true)
     .setFont(createFont("arial", 20))
     .setLabel("PAUSE")
     .setColorActive(color(255,0,0))
     .setColorForeground(color(0,255,255))
     .updateSize()
     ;
     
  restartButton=controlP5.addButton("RestartButton")
     .setValue(1)
     .setPosition(470,70)
     .setSize(100, 50)
     .setLabelVisible(true)
     .setFont(createFont("arial", 20))
     .setLabel("START")
     .setColorActive(color(255,0,0))
     .setColorForeground(color(0,255,255))
     .updateSize()
     ;
     
  chaine_Text=controlP5.addTextfield("chemin_Text")
    .setPosition(140, 270)
    .setSize(310,50)
    .setFont(createFont("arial", 30))
    .setAutoClear(false)
    .setValue(chaineEnvoi)
    .setLabelVisible(false)
    .setLabel("Nom de la fenetre")
    .setColorActive(color(255,0,0))
    .setColorForeground(color(0,255,255))
  ;
  
  begin = millis();
}

void draw() {
  background(0);
  textSize(32);
  text("Temps en s : ", 10, 40);
  text(time, 280, 40);
  text("Temps restant : ", 10, 80);
  text(m, 260, 80);
  text(" min ", 305, 80);
  text(s, 375, 80);
  text(" s ",420, 80);
  
  if(!restart)
  {
  if(!pause)
  {
    savetime=time;//time+savetime;
    print("Temps pause");
    println(savetime);
    depause=false;
  }
  else
  {
    if(entreePlusMin>0)
    {
      duration=+ duration + entreePlusMin*60 ;
      entreePlusMin=0;
    }
    
    if(entreePlusMin<0)
    {
      duration= duration + entreePlusMin*60 ;
      entreePlusMin=0;
    }
    
    if(entreeMoinsMin>0)
    {
      duration= duration - entreeMoinsMin*60 ;
      entreeMoinsMin=0;
    }
    
    if(entreeMoinsMin<0)
    {
      duration= duration - entreeMoinsMin*60 ;
      entreeMoinsMin=0; 
    }
       
    if(entreePlusSec>0)
    {
      duration=+ duration + entreePlusSec ;
      entreePlusSec=0;
    }
    
    if(entreePlusSec<0)
    {
      duration= duration + entreePlusSec ;
      entreePlusSec=0;
    }
    
    if(entreeMoinsSec>0)
    {
      duration= duration - entreeMoinsSec ;
      entreeMoinsSec=0;
    }
    
    if(entreeMoinsSec<0)
    {
      duration= duration - entreeMoinsSec ;
      entreeMoinsSec=0; 
    }
    
      time = duration + loadtime + (millis() - begin)/1000;
      m=time/60;
      s=time-m*60;
      
      if(!depause)
      {
        depause=true;
        println("Temps depause");
        println("time:"+time);
        println("savetime:"+savetime);
        loadtime=savetime-time+loadtime;
        println("loadtime:"+loadtime);
      }
      
    if(time<0)
    {
      text("Fin du temps", 170, 115);
    }
  }
  }
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
}

public void PauseButton(){
        println("Evènement IncrementationButton");
        print("Envoi de la pause :");
        pause= !pause;
        print(pause+"\n");
}
public void RestartButton(){
        println("Evènement IncrementationButton");
        print("Envoi du restart :");
        print(restart+"\n");
        begin=millis(); 
        duration = 0;
        time = 0;
        h=0; //Heure conversion
        m=0; //Minute conversion
        s=0; //Seconde conversion
        entreePlusMin=0;
        entreeMoinsMin=0;
        entreePlusSec=0;
        entreeMoinsSec=0;
        chaineEnvoi=0;
        savetime=0;
        loadtime=0;
}

public void Incrementation_minButton() { // fonction évènement Button de meme nom - reçoit la valeur

        println("Evènement IncrementationButton");
        print("Envoi de la chaine :");
        print(chaine_minText.getText()+"\n");
        entreePlusMin=int(chaine_minText.getText());
} // fin evènement bouton envoi

public void Decrementation_minButton() { // fonction évènement Button de meme nom - reçoit la valeur

        println("Evènement DecrementationButton");
        print("Envoi de la chaine :");
        print(chaine_minText.getText()+"\n");
        entreeMoinsMin=int(chaine_minText.getText());
} // fin evènement bouton envoi

public void chaine_minText(int theText) { // fonction évènement Textfield de meme nom - déclenché par return - reçoit la chaine

        println("Evènement CheminText avec valeur = "+theText);

        chaineEnvoi=theText; // mémorise le contenu du champ

        println("Le chemin est :"+chaineEnvoi);

} // fin evènement champ texte chemin fichier


public void Incrementation_secButton() { // fonction évènement Button de meme nom - reçoit la valeur

        println("Evènement IncrementationButton");
        print("Envoi de la chaine :");
        print(chaine_secText.getText()+"\n");
        entreePlusSec=int(chaine_secText.getText());
} // fin evènement bouton envoi

public void Decrementation_secButton() { // fonction évènement Button de meme nom - reçoit la valeur

        println("Evènement DecrementationButton");
        print("Envoi de la chaine :");
        print(chaine_secText.getText()+"\n");
        entreeMoinsSec=int(chaine_secText.getText());
} // fin evènement bouton envoi

public void chaine_secText(int theText) { // fonction évènement Textfield de meme nom - déclenché par return - reçoit la chaine

        println("Evènement CheminText avec valeur = "+theText);

        chaineEnvoi=theText; // mémorise le contenu du champ

        println("Le chemin est :"+chaineEnvoi);

} // fin evènement champ texte chemin fichier