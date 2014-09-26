/*
This sketch demonstrates how to send data from a Device
to a Host in a Gazell network.

The host and upto 3 devices should have the RGB shield
attached.  When Button A on a Device is pressed, the
associated led on the Host will toggle.  Device1 is
associated with the Red led, Device2 with the Green led
and Device3 with the Blue led.

The Green led on the Device will blink to indicate
that an acknowledgement from the Host was received.
*/

#include <RFduinoGZLL.h>

device_t role = HOST;

// pin for the Green Led
int green_led = 3;

void setup()
{
 
  Serial.begin(9600);
  //RFduinoBLE_custom_uuid = "0D0A0704";
  Serial.println(); 
  RFduinoGZLL_host_base_address = 0x0D0A0704;
  RFduinoGZLL_device_base_address=0x0E0B0805;
  Serial.begin(9600);
  Serial.print(RFduinoGZLL_host_base_address);
  
  pinMode(green_led, OUTPUT);
  // start the GZLL stack  
  RFduinoGZLL.begin(role);
}

void loop()
{
}

  void RFduinoGZLL_onReceive(device_t device, int rssi, char *data, int len)
{
  char state = data[0];
  Serial.println(state);

}
