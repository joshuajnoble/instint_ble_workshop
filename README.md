instint_ble_workshop
====================


This is for a workshop I ran at instint 2014 and it has a bunch of components to it:


board: eagle files that I created for the board that we used.
ios: openframeworks applications for running on a BLE compatible IOS device
osx: openframeworks applications for running on a BLE compatible OSX device
processing: processing applications for running on a BLE compatible Android device
rfduino: applications that running on the RFDuino BLE platform

In the workshop we used a few different components:

https://www.sparkfun.com/products/8680	SoftPot Membrane Potentiometer - 50mm
https://www.sparkfun.com/products/9873	FTDI Basic Breakout - 3.3V
https://www.sparkfun.com/products/9264	LED - RGB Diffused Common Cathode
https://www.sparkfun.com/products/11026	Jumper Wires Standard 7\" M/M Pack of 30
https://www.sparkfun.com/products/12002	Breadboard - Self-Adhesive (White)
https://www.sparkfun.com/products/11446	Triple Axis Accelerometer Breakout - ADXL362

So here's what these different applications do:

* sayhi - just says hi back and from the RFDuino to the host device
* changeLED - sends an LED signals to the RFDuino to control an RGB LED
* receiveAcc - receives a accelerometer signal from the rfduino and moves a little ball around on the screen (pretty dull tbh)

There's another one that only run on the RFDuino:

* customID - runs on a device and sends a message to another device
* customIDdevice - runs on a device and sends a message to another device

I have a hacked RFDuino install, so drop that in your Arduino (or Arduino.app) hardware/arduino folder. I also have a hacked Processing Android mode, so drop that in your Processing/modes folder to leverage features in more contemporary Android releases (i.e. v18+)

