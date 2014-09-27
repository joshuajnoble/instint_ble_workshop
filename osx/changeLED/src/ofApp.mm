#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){

    connected = false;
    
        ble = [[BLEDelegate alloc] init];
    [ble initialize];
    [ble setApplication:this];
    
    rgb[0] = 0;
    rgb[1] = 0;
    rgb[2] = 0;

    err = "";

}

//--------------------------------------------------------------
void ofApp::update(){

}

void ofApp::exit(){

    [ble cleanup];
    [ble close];
}

//--------------------------------------------------------------
void ofApp::draw(){

    if(err != "")
    {

        ofDrawBitmapString(err, 100, 100);
    }
    else
    {
        ofSetColor(255, 0, 0);
        ofRect(0, 0, ofGetWidth()/3, ofGetHeight());
        ofSetColor(0, 255, 0);
        ofRect(ofGetWidth()/3, 0, (ofGetWidth()/3 * 2), ofGetHeight());
        ofSetColor(0, 0, 255);
        ofRect( (ofGetWidth()/3 * 2), 0, ofGetWidth(), ofGetHeight());
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
    if( x < ofGetWidth() / 3 )
    {
        rgb[0] = (unsigned char) ofMap(y, 0, ofGetHeight(), 0, 255);
    }
    else if( x < (ofGetWidth() * 2) / 3 )
    {
        rgb[1] = (unsigned char) ofMap(y, 0, ofGetHeight(), 0, 255);
    }
    else
    {
        rgb[2] = (unsigned char) ofMap(y, 0, ofGetHeight(), 0, 255);
    }
    
    [ble send:&rgb[0] len:3];
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
    
}