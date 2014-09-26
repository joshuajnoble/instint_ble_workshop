/*
This sketch demonstrates how to send data from a Device
to a Host in a Gazell network.

When Button A on the Device is pressed and released,
the green led on the host will toggle.
*/

#include <RFduinoGZLL.h>

device_t role = DEVICE0;

void setup()
{
  // start the GZLL stack
  RFduinoGZLL_host_base_address = 0x0D0A0704;
  RFduinoGZLL_device_base_address=0x0E0B0805;
  RFduinoGZLL.begin(role);
}

void loop()
{
  delay(2000);
  // send state to Host
  RFduinoGZLL.sendToHost('1');
}

void RFduinoGZLL_onReceive(device_t device, int rssi, char *data, int len)
{
}
