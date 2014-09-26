#include <RFduinoBLE.h>

const int sliderPin = 2;    // the number of the pushbutton pin
const int powerPin = 3;      // the number of the LED pin

void setup() {
  pinMode(sliderPin, INPUT);
  pinMode(powerPin, OUTPUT);

  // set initial LED state
  digitalWrite(powerPin, HIGH);
  
  Serial.begin(9600);
  
  RFduinoBLE.deviceName = "Distinct Name";
  RFduinoBLE.advertisementData = "service";
  RFduinoBLE.begin();
}

void loop() 
{
  int reading = analogRead(sliderPin);
  Serial.println(reading);
  
  RFduinoBLE.sendByte(reading);
  
  delay(50);
}

