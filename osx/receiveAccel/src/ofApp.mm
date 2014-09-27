#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){

    connected = false;
    
    ble = [[BLEDelegate alloc] init];
    [ble initialize];
    [ble setApplication:this];

    err = "";
}

void ofApp::exit()
{
    [ble cleanup];
    [ble close];
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw()
{

    if(err != "")
    {
        ofDrawBitmapString(err, 100, 100);
    }
    else
    {
        ofPushMatrix();
        
        ofTranslate(vector);
        ofDrawSphere(0, 0, 50);
        
        ofPopMatrix();
    }
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}

void ofApp::onBluetooth()
{
    if([ble isLECapableHardware])
    {
        [ble startScan];
    }
    else
    {
        cout << " uh oh, this computer won't work :( :( :( :( " << endl;
        err = " uh oh, this computer won't work :( :( :( :( ";
    }
}


void ofApp::didDiscoverRFduino(CBPeripheral *rfduino)
{
    cout << " didDiscoverRFduino " << [rfduino name] << endl;
    
    if( [[rfduino name] isEqualTo:@"MY RFDUINO NAME"])
    {
         [ble connectDevice:rfduino];
    }
}

void ofApp::didUpdateDiscoveredRFduino(CBPeripheral *rfduino)
{
    cout << " didUpdateDiscoveredRFduino " << endl;
}

void ofApp::didConnectRFduino(CBPeripheral *rfduino)
{
    cout << " didConnectRFduino " << endl;
    connected = true;
}

void ofApp::didLoadServiceRFduino(CBPeripheral *rfduino)
{
    cout << " didLoadServiceRFduino " << endl;
}

void ofApp::didDisconnectRFduino(CBPeripheral *rfduino)
{
    cout << " didDisconnectRFduino " << endl;
}

void ofApp::receivedData( unsigned char *data)
{
    cout << " got some data! " << endl;
    
    int16_t x, y, z;
    //memcpy(&f2, &buffer, sizeof(buffer));
    memcpy(&x, &data[0], sizeof(int16_t));
    memcpy(&y, &data[sizeof(int16_t)], sizeof(int16_t));
    memcpy(&z, &data[sizeof(int16_t) * 2], sizeof(int16_t));
    
    vector.x += x;
    vector.y += y;
    vector.z += z;
    
    vector.x = ofClamp(vector.x, 0, ofGetWidth());
    vector.y = ofClamp(vector.y, 0, ofGetHeight());
    vector.z = ofClamp(vector.z, -100, 100);

    
}