import processing.sound.*;

SoundFile T, MT, SELT, BT, BT2, FF, Move, Accept, Accept2, Accept3, atk1_1, atk1_2, atk1_3, atk2_1, atk2_2, atk2_3;
PFont Font;
int HP1 = 1500, HP2 = 1500, MP1, MP2, MPGAIN1, MPGAIN2, MPSKL1_1, MPSKL1_2, MPSKL1_3, MPSKL2_1, MPSKL2_2, MPSKL2_3;
int SKL1_1, SKL1_2, SKL1_3, SKL2_1, SKL2_2, SKL2_3;
int Turn = 0, TurnSel = 0, screen = 0, dscreen = 1, Sel1, Sel2, conf1, conf2;
int T_Y = 0, T_Y1 = 1, dy = 1, text = 28, timer = 999;
float alpha1 = 0, alpha2= 0, alpha3 = 0, logoy = 300, logoy1 = 1 ;
PImage T1, T1_1, T1_2, T1_3, T1_4, T1_5, T1_6, T1_7; /// TITLE SCREEN
PImage T2_0, T2_1, T2_2, T2_3, T2_4, T2_5; //// SELECTION IMAGES
PImage T2_P1_1, T2_P1_2, T2_P1_3, T2_P1_4, T2_P1_5; /// RED AVATARS
PImage T2_P2_1, T2_P2_2, T2_P2_3, T2_P2_4, T2_P2_5; /// BLUE AVATARS
PImage T2_D1_1, T2_D1_2, T2_D1_3, T2_D1_4, T2_D1_5; /// P1 DESC
PImage T2_D2_1, T2_D2_2, T2_D2_3, T2_D2_4, T2_D2_5; /// P2 DESC
int sel1x= 0, sel2x = 0, sel1y = 0, sel2y = 0, sel1=0, sel2=1; //////////7 selection variables 
PImage SELA, SELB, DESC1, DESC2; ///////DESCRIPTIONS
PImage T2_W1, T2_W2, T2_W3, T2_W4, T2_W5, P1W, P2PW;
int sklsel1, sklsel2;
PImage T3_01, T3_02, T3_03, T3_04, T3_05, T3_06, T3_07, T3_08; /// BATTLE IMAGES
PImage P1_1, P1_2, P1_3, P1_4, P1_5, P1_6, P1_7; /// P1 BATTLERS
PImage P2_1, P2_2, P2_3, P2_4, P2_5, P2_6, P2_7; /// P1 BATTLERS
PImage A1_1, A1_2, A1_3, A1_4, A1_5, A1_6, A1_7; /// NERO BATTLERS P1
PImage A2_1, A2_2, A2_3, A2_4, A2_5, A2_6, A2_7; /// NERO BATTLERS P1
PImage CurrentFrameP1, CurrentFrameP2;

void setup () 
{

  MT = new SoundFile (this, "MT.mp3");
  SELT = new SoundFile (this, "SELT.mp3");
  BT = new SoundFile (this, "BT.mp3");
  BT2 = new SoundFile (this, "BT2.mp3");
  FF = new SoundFile (this, "FF.mp3");
  T = MT;
  T.loop();

  frameRate (60);
  size (1366, 768);
  Font = loadFont ("AlexandriaFLF-48.vlw");
  textFont (Font);
  /// TITLE SCREEN IMAGES
  T1 = loadImage ("SC0/T1.jpg");
  T1_1 = loadImage ("SC0/T1-1.png");
  T1_2 = loadImage ("SC0/T1-2.png");
  T1_3 = loadImage ("SC0/T1-3.png");
  T1_4 = loadImage ("SC0/T1-4.png");
  T1_5 = loadImage ("SC0/T1-5.png");
  T1_6 = loadImage ("SC0/T1-6.png");
  T1_7 = loadImage ("SC0/T1-7.png");
  /// SELECTION SCREEN IMAGES
  T2_0 = loadImage ("SC1/T2_0.png");
  T2_1 = loadImage ("SC1/T2_1.png");
  T2_2 = loadImage ("SC1/T2_2.png"); //P1 CURSOR
  T2_3 = loadImage ("SC1/T2_3.png"); // P2 CURSOR
  T2_4 = loadImage ("SC1/T2_4.png"); // P2 CURSOR
  T2_5 = loadImage ("SC1/T2_5.png"); // START
  T2_P1_1 = loadImage ("SC1/T2_P1_01.png"); // RED AVATARS
  T2_P1_2 = loadImage ("SC1/T2_P1_02.png");
  T2_P1_3 = loadImage ("SC1/T2_P1_03.png"); 
  T2_P1_4 = loadImage ("SC1/T2_P1_04.png"); 
  T2_P1_5 = loadImage ("SC1/T2_P1_05.png");
  T2_P2_1 = loadImage ("SC1/T2_P2_01.png"); // BLUE AVATARS
  T2_P2_2 = loadImage ("SC1/T2_P2_02.png");
  T2_P2_3 = loadImage ("SC1/T2_P2_03.png"); 
  T2_P2_4 = loadImage ("SC1/T2_P2_04.png"); 
  T2_P2_5 = loadImage ("SC1/T2_P2_05.png");
  T2_D1_1 = loadImage ("SC1/T2_D1_01.png"); // P1 DESC
  T2_D1_2 = loadImage ("SC1/T2_D1_02.png");
  T2_D1_3 = loadImage ("SC1/T2_D1_03.png"); 
  T2_D1_4 = loadImage ("SC1/T2_D1_04.png"); 
  T2_D1_5 = loadImage ("SC1/T2_D1_05.png");
  T2_D2_1 = loadImage ("SC1/T2_D2_01.png"); // P2 DESC
  T2_D2_2 = loadImage ("SC1/T2_D2_02.png");
  T2_D2_3 = loadImage ("SC1/T2_D2_03.png"); 
  T2_D2_4 = loadImage ("SC1/T2_D2_04.png"); 
  T2_D2_5 = loadImage ("SC1/T2_D2_05.png");
  T3_01 = loadImage ("SC2/T3_01.png"); //// BATTLE SCREEN
  T3_02 = loadImage ("SC2/T3_02.png");
  T3_03 = loadImage ("SC2/T3_03.png");
  T3_04 = loadImage ("SC2/T3_04.png");
  T3_05 = loadImage ("SC2/T3_05.png");
  T3_06 = loadImage ("SC2/T3_06.png");
  T3_07 = loadImage ("SC2/T3_07.png");
  T3_08 = loadImage ("SC2/T3_08.png");
  A1_1 = loadImage ("SC2/A1/P1_1.png"); /// NERO BATTLERS P1
  A1_2 = loadImage ("SC2/A1/P1_2.png");
  A1_3 = loadImage ("SC2/A1/P1_3.png");
  A1_4 = loadImage ("SC2/A1/P1_4.png");
  A1_5 = loadImage ("SC2/A1/P1_5.png");
  A1_6 = loadImage ("SC2/A1/P1_6.png");
  A1_7 = loadImage ("SC2/A1/P1_7.png");
  A2_1 = loadImage ("SC2/A1/P2_1.png"); /// NERO BATTLERS P2
  A2_2 = loadImage ("SC2/A1/P2_2.png");
  A2_3 = loadImage ("SC2/A1/P2_3.png");
  A2_4 = loadImage ("SC2/A1/P2_4.png");
  A2_5 = loadImage ("SC2/A1/P2_5.png");
  A2_6 = loadImage ("SC2/A1/P2_6.png");
  A2_7 = loadImage ("SC2/A1/P2_7.png");


  P1W = loadImage ("SC2/W_01.png"); //// skill wheels
}

void keyReleased()
{


  if (screen == 0 && key == ENTER)
  {
    
    T.stop();
    SELT.loop();
  }

  if (screen == 1 && key == ENTER && conf1 > 0 && conf2 > 0)
  {
    SELT.stop();
    BT2.loop();
  }

  if (screen == 2 && key == ENTER && HP1 <= 0)
  {
    BT2.stop();
    T.loop();
  }

  if (screen == 2 && key == ENTER && HP2 <= 0)
  {
    BT2.stop();
    T.loop();
  }

  if (key == ENTER && screen == 0) /// ADVANCE SCREEN
  {
    screen += dscreen;
    alpha1 = 0;
    alpha2 = 0;
    alpha3 = 0;
    sel1 = 0;
    sel2 =1;
    timer = 999;
    Turn = 0;
  }

  if ( key == 'P' | key == 'p') /// RETURN SCREEN
  {
    screen -= dscreen;
    alpha1 = 0;
    alpha2 = 0;
    alpha3 = 0;
    sel1 = 0;
    sel2 =1;
    timer = 999;
    conf1 = 0; 
    conf2 = 0;
    Turn = 0;
  }

  if (key == ENTER && screen == 1 && conf1 > 0 && conf2 > 0) /// ADVANCE SCREEN
  {
    screen += dscreen;
    alpha1 = 0;
    alpha2 = 0;
    alpha3 = 400;
    sel1 = 0;
    sel2 = 1;
    timer = 999;
    Turn = 0;
  }
  /////////////////////// P2 SEL
  if ( keyCode == RIGHT)
  {
    sel2 += 1;
  }

  if (sklsel1 > 2)
  {
    sklsel1= 0;
  }

  if (keyCode == LEFT )
  {
    sel2 -= 1;
  }
  if (keyCode == LEFT && Turn == 0 && screen == 2)
  {
    sklsel1 -= 1;
  }
  if (sklsel1 < 0)
  {
    sklsel1= 2;
  }

  if (sel2 >= 2)
  {
    sel2 = 2;
  }
  if (sel2 <= -2)
  {
    sel2= -2;
  }
  if ( sel2 == 1)
  {
    sel2x= 50;
    sel2y= -20;
    SELB = T2_P2_2;
    DESC2 = T2_D2_2;
  }
  if (sel2 == 2)
  {
    sel2x = 110;
    sel2y = 0;
    SELB = T2_P2_5;
    DESC2 = T2_D2_5;
  }

  if (sel2 == 0)
  {
    sel2x = -50;
    sel2y = -20;
    SELB = T2_P2_1;
    DESC2 = T2_D2_1;
  }

  if (sel2 == -1)
  {
    sel2x = -110;
    sel2y = -20;
    SELB = T2_P2_3;
    DESC2 = T2_D2_3;
  }

  if (sel2 == -2)
  {
    sel2x = -160;
    sel2y = -20;
    SELB = T2_P2_4;
    DESC2 = T2_D2_4;
  }

  ///////////////////////////////////////// P1
  if ( key == 'd' || key == 'D')
  {
    sel1 += 1;
  }
  if (key == 'a' || key == 'A' )
  {
    sel1 -= 1;
  }

  if (sel1 >= 2)
  {
    sel1 = 2;
  }
  if (sel1 <= -2)
  {
    sel1= -2;
  }
  if ( sel1 == 1)
  {
    sel1x= 50;
    sel1y= 50;
    SELA = T2_P1_2;
    DESC1 = T2_D1_2;
  }
  if (sel1 == 2)
  {
    sel1x = 100;
    sel1y = 50;
    SELA = T2_P1_5;
    DESC1 = T2_D1_5;
  }

  if (sel1 == 0)
  {
    sel1x = -50;
    sel1y = 50;
    SELA = T2_P1_1;
    DESC1 = T2_D1_1;
  }

  if (sel1 == -1)
  {
    sel1x = -90;
    sel1y = 45;
    SELA = T2_P1_3;
    DESC1 = T2_D1_3;
  }

  if (sel1 == -2)
  {
    sel1x = -140;
    sel1y = 50;
    SELA = T2_P1_4;
    DESC1 = T2_D1_4;
  }

  /////////// SELECTION /////

  if ( key == 'l' || key == 'L' && screen == 1)
  {
    {
      conf2 = sel2;
    }
    if ( sel2 == 0)
    {
      conf2 = 6;
    }

    if ( sel2 == 1)
    {
      conf2 = 7;
    }

    if ( sel2 == 2)
    {
      conf2 = 8;
    }

    if ( sel2 == -1)
    {
      conf2 = 9;
    }

    if ( sel2 == -2)
    {
      conf2 = 10;
    }
    if (conf2 == 6 && screen == 1) /// NERO SELECTION P1
    {
      P2_1 = A2_1;
      P2_2 = A2_2;
      P2_3 = A2_3;
      P2_4 = A2_4;
      P2_5 = A2_5;
      P2_6 = A2_6;
      P2_7 = A2_7;
      MP2 = 0;
      MPGAIN2 = 30;
      SKL2_1 = 70;
      SKL2_2 = 120;
      SKL2_3 = 200;
      MPSKL2_1 = 50;
      MPSKL2_2 = 100;
    }
  }
  if ( key == 'b' || key == 'B' && screen == 1)
  {
    {
      if ( sel1 == 0)
      {
        conf1 = 1;
      }

      if ( sel1 == 1)
      {
        conf1 = 2;
      }

      if ( sel1 == 2)
      {
        conf1 = 5;
      }

      if ( sel1 == -1)
      {
        conf1 = 3;
      }

      if ( sel1 == -2)
      {
        conf1 = 4;
      }
      if (conf1 == 1 && screen == 1) /// NERO SELECTION P1
      {
        P1_1 = A1_1;
        P1_2 = A1_2;
        P1_3 = A1_3;
        P1_4 = A1_4;
        P1_5 = A1_5;
        P1_6 = A1_6;
        P1_7 = A1_7;

        MP1 = 0;
        MPGAIN1 = 30;
        SKL1_1 = 70;
        SKL1_2 = 120;
        SKL1_3 = 200;
        MPSKL1_1 = 50;
        MPSKL1_2 = 100;
      }
    }
  }
}








void draw()
{  

  if (screen == 0) ///////////////////////////// TITLE SCREEN
  {
    tint (255, alpha1);

    image (T1, 0, 0);
    image (T1_2, 0, T_Y);
    image (T1_3, 0, T_Y);
    image (T1_4, 0, T_Y);
    image (T1_5, 0, T_Y);
    image (T1_5, 0, T_Y);
    image (T1_6, 0, T_Y);
    image (T1_7, 0, T_Y);

    if (T_Y <= 0)
    {
      T_Y1 = 1;
    }

    if (T_Y >= 50)
    {
      T_Y1 = -1;
    }


    T_Y = T_Y + T_Y1;
    alpha1 += 10;
    if (alpha1 >= 100)
    {
      pushMatrix();
      tint(255, alpha2);
      image (T1_1, 0, 100);
      alpha2 += 10;
      popMatrix();
    }
  }




  if (screen == 1) //////////////////////// SELECTION SCREEN
  {

    pushMatrix();
    background (0);
    frameRate (60);
    tint (255, alpha3);
    image (T2_0, 0, 0);


    image (SELA, 0, 0); /// AVATAR A 
    image (SELB, 0, 0); /// AVATAR B
    image (T2_1, 0, 0); /// BG
    image (T2_2, sel1x, sel1y); /// P1 CURSOR
    image (T2_3, sel2x, sel2y); /// P2 CURSOR
    image (T2_4, 0, 0); /// SELECTION BAR
    image (DESC1, 0, 0);
    image (DESC2, 0, 0);
    textSize(50);
    text (timer, width/2-50, height/2+250);

    timer -= 0.005;

    alpha3 += 10;
    popMatrix();
    if (conf1 > 0 && conf2 > 0 && screen == 1 )
    {
      image( T2_5, 0, 0);
    }
  }

  if (screen == 2) /////////////////// screen = 2

  {
    tint (255, alpha1);
    if (HP1 <= 400 || HP2 <= 400)
    {
    }
    if (HP1 <= 0 || HP2 <= 0)
    {
    }
    {
      alpha3 = 400;
      if (HP1 < 0)
      {
        HP1 = 0;
      }
      if (HP2 < 0)
      {
        HP2 = 0;
      }

      if (HP1 >= 501)
      {
        CurrentFrameP1 = P1_1;
      }
      if (HP1 > 0 && HP1 <= 500)
      {
        CurrentFrameP1 = P1_5;
      }
      if (HP1 == 0)
      {
        CurrentFrameP1 = P1_6;
      }
      if (key == '1'  && Turn == 0 && HP1 > 0 && HP2 > 0)
      {
        CurrentFrameP1 = P1_2;
        Turn += 1;
        HP2 -= SKL1_1;
        MP1 += MPGAIN1;
      }

      if (key == '2'  && Turn == 0 && MP1 >= MPSKL1_1 && HP1 > 0 && HP2 > 0)
      {
        CurrentFrameP1 = P1_3;
        Turn += 1;
        HP2 -= SKL1_2;
        MP1 -= MPSKL1_1;
      }

      if (key == '3'  && Turn == 0 && MP1 >= MPSKL1_2 && HP1 > 0 && HP2 > 0)
      {
        CurrentFrameP1 = P1_4;
        Turn += 1;
        HP2 -= SKL1_3;
        MP1 -= MPSKL1_2;
      } ///////// END P1 FRAMES

      if (HP2 >= 501)
      {
        CurrentFrameP2 = P2_1;
      }
      if (HP2 > 0 && HP2 <= 500)
      {
        CurrentFrameP2 = P2_5;
      }
      if (HP2 == 0)
      {
        CurrentFrameP2 = P2_6;
      }
      if (key == '8'  && Turn == 1 && HP1 > 0 && HP2 > 0)
      {
        CurrentFrameP2 = P2_2;
        Turn -= 1;
        HP1 -= SKL2_1;
        MP2 += MPGAIN2;
      }

      if (key == '9'  && Turn == 1 && MP2 >= MPSKL2_1 && HP1 > 0 && HP2 > 0)
      {
        CurrentFrameP2 = P2_3;
        Turn -= 1;
        HP1 -= SKL2_1;
        MP2 -= MPSKL2_1;
      }

      if (key == '0'  && Turn == 1 && MP2 >= MPSKL2_1 && HP1 > 0 && HP2 > 0)
      {
        CurrentFrameP2 = P2_4;
        Turn -= 1;
        HP1 -= SKL2_2;
        MP2 -= MPSKL2_2;
      } ///////// END P2 FRAMES
    }
    frameRate(4);
    background (0);
    image (CurrentFrameP1, 0, 0); ///P1
    image (CurrentFrameP2, 0, 0); /// P2


    textSize (60);
    fill( 140, 37, 82);
    text( HP1, 160, 210);
    text( HP2, 1050, 210);
    fill( 119, 159, 188);
    text( MP1, 160, 260);
    text( MP2, 1160, 260);
    image  (T3_04, 0, 0); 
    image  (T3_02, 0, 0);
    image  (T3_03, 0, 0);

    image (P1_7, 0, 0);
    image (P2_7, 0, 0);
    image  (T3_01, 0, 0);

    alpha1 += 10;
    if (Turn == 0 && HP1 > 0 && HP2 > 0)
    {
      image (T3_05, 0, 0);
    }

    if (Turn == 1 && HP1 > 0 && HP2 > 0)
    {
      image (T3_06, 0, 0);
    }
    if (HP1 <= 0)
    {
      image (T3_08, 0, 0);
      if (key == ENTER)
      {

        alpha1 = 0;
        alpha2 = 0;
        alpha3 = 0;
        sel1 = 0;
        sel2 =1;
        conf1= 0;
        conf2 = 0;
        timer = 999;
        Turn = 0;
        screen = 0;
        BT.stop();
        SELT.stop();
        HP1 = 1500;
        HP2 = 1500;
      }
    }

    if (HP2 <= 0)
    {
      image (T3_07, 0, 0);
      if (key == ENTER)
      {
        ;
        alpha1 = 0;
        alpha2 = 0;
        alpha3 = 0;
        sel1 = 0;
        sel2 =1;
        conf1= 0;
        conf2 = 0;
        timer = 999;
        Turn = 0;
        screen = 0;
        BT.stop();
        SELT.stop();
        HP1 = 1500;
        HP2 = 1500;
      }
    }
  }
}