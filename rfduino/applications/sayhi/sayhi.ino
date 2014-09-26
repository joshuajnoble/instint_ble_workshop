
#include <RFduinoBLE.h>

void setup() {
  Serial.begin(9600);
  Serial.println("Waiting for connection...");
  RFduinoBLE.deviceName = "JOSHS_RFDUINO";
  RFduinoBLE.advertisementData = "service";
  RFduinoBLE.begin();
}

void RFduinoBLE_onConnect() {
  
  Serial.println("Connected!");
  // first send is not possible until the iPhone completes service/characteristic discovery
}

void RFduinoBLE_onReceive(char *data, int len)
{
  Serial.println(data);
  delay(1000);
  char hello[] = {'h', 'e', 'l', 'l', 'o'};
  RFduinoBLE.send(hello, 5);
}

void loop() {

}

