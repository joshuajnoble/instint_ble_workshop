
#include <RFduinoBLE.h>

void setup() {
  Serial.begin(9600);
  Serial.println("Waiting for connection...");

  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);

  RFduinoBLE.deviceName = "My Device";
  RFduinoBLE.advertisementData = "service";
  RFduinoBLE.begin();
}

void RFduinoBLE_onConnect() {
  Serial.println("Connected!");
}

void RFduinoBLE_onReceive(char *data, int len)
{

  // did we get the right amount of data?
  if ( len == 3 )
  {
    Serial.println( data );
    long all = strtol(data, NULL, 16);

    int r = (int) data[0]; // Faster way of getting red(argb)
    int g = (int) data[1]; // Faster way of getting green(argb)
    int b = (int) data[2]; // Faster way of getting blue(argb)

    analogWrite(2, r);
    analogWrite(3, g);
    analogWrite(4, b);
  }
}

void loop() {

}

