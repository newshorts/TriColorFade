/*

AUTHOR: Michael Newell
SITE: http://iwearshorts.com/

Based on the original FADE sketch under the Basics tab of default arduino sketches. 

No License, feel free to do whatever you want with this.

This sketch articulates how to fade different hues of a tri-color LED in and out continuously.

*/

float fadeAmount = 0.01;    // how many points to fade the LED by
float percentage = 0.98;    // where to start

void setup()  { 
  Serial.begin(9600);
  // declare pin 9 to be an output:
  pinMode(9, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);

  
} 

void loop()  { 
  
  // change the percentage for next time through the loop:
  percentage = percentage + fadeAmount;
  
  analogWrite(9, setPin9(percentage)); // red
  analogWrite(10, setPin10(percentage)); // blue
  analogWrite(11, setPin11(percentage)); // green

  // reverse the direction of the fading at the ends of the fade: 
  if(int(percentage*100) == 1.00) {
    Serial.println("changed to a negative fadeAmount");
    Serial.println(fadeAmount);
    fadeAmount = -fadeAmount; 
  }
  
  if(int(percentage*100) == 99.00) {
    Serial.println("changed to a negative fadeAmount");
    Serial.println(fadeAmount);
    fadeAmount = -fadeAmount; 
  }
  
  // wait for 30 milliseconds to see the dimming effect    
  delay(300);                            
}

int setPin9 (float percent) {
  if(int(percent*100) < 49.00 && int(percent*100) > 1.00) {
    return 255 * cos( .5 * (PI * (percent * 2) ) );
  } else {
    return 0;
  }
}
  
int setPin10 (float percent) {
  return 255 * sin( .5 * (TWO_PI * percent) ); 
}
  
int setPin11 (float percent) {
  if(int(percent*100) > 50.00 && int(percent*100) < 99.00) {
    return 255 * sin( .5 * (PI * (2 * (percent - .5) ) ) );
  } else {
    return 0;
  }
}


