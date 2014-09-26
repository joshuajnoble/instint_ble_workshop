#include <SPI.h>
#include <ADXL362.h>
#include <RFduinoBLE.h>

ADXL362 xl;

int16_t XValue, YValue, ZValue, temp;

void setup(){
  
  Serial.begin(9600);
  
  Serial.println(" ok " );
  
  RFduinoBLE.deviceName = "Distinct Name";
  RFduinoBLE.advertisementData = "service";
  RFduinoBLE.begin();
  
  xl.begin(6);                   // Setup SPI protocol, issue device soft reset
  xl.beginMeasure();              // Switch ADXL362 to measure mode  
}

void loop()
{    
  // read all three axis in burst to ensure all measurements correspond to same sample time
  
  xl.readXYZTData(XValue, YValue, ZValue, temp);  

  char buffer[sizeof(int16_t) * 3];
  memcpy(&buffer[0], &XValue, sizeof(int16_t));
  memcpy(&buffer[sizeof(int16_t)], &YValue, sizeof(int16_t));
  memcpy(&buffer[sizeof(int16_t) * 2], &ZValue, sizeof(int16_t));
  RFduinoBLE.send( &buffer[0], sizeof(int16_t) * 3);
  
  Serial.print(XValue);
  Serial.print(" ");
  Serial.print(YValue);
  Serial.print(" ");
  Serial.println(ZValue);
  
  delay(200); // this means 5 times a second
}

