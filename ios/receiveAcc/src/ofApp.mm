#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup()
{
    //rfduinoManager = RFduinoManager.sharedRFduinoManager;
    
    rfduinoImpl = [[ofxRFduinoDelegate alloc] init];
    [rfduinoImpl setApplication:this];
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
	ofPushMatrix();
    
    ofTranslate(vector);
    ofDrawSphere(0, 0, 50);
    
    ofPopMatrix();
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}

//--------------------------------------------------------------
void ofApp::didDiscoverRFduino(RFduino *rfduino)
{
    cout << " didDiscoverRFduino " << endl;
    string myRFDuinoName = "Distinct Name";
    string foundRfdName = ofxRFDGetName(rfduino);
    
    if(foundRfdName == myRFDuinoName)
    {
        ofxRFDConnectRFduino(rfduino);
    }
}

void ofApp::didUpdateDiscoveredRFduino(RFduino *rfduino)
{
    cout << " didUpdateDiscoveredRFduino " << endl;
}

void ofApp::didConnectRFduino(RFduino *rfduino)
{
    cout << " didConnectRFduino " << endl;
}

void ofApp::didLoadServiceRFduino(RFduino *rfduino)
{
    cout << " didLoadServiceRFduino " << endl;
}

void ofApp::didDisconnectRFduino(RFduino *rfduino)
{
    cout << " didDisconnectRFduino " << endl;
}

void ofApp::receivedData( const char *data)
{
    cout << " got some data! " << data << endl;
    
    
    int16_t x, y, z;
    //memcpy(&f2, &buffer, sizeof(buffer));
    memcpy(&x, &data[0], sizeof(int16_t));
    memcpy(&y, &data[sizeof(int16_t)], sizeof(int16_t));
    memcpy(&z, &data[sizeof(int16_t) * 2], sizeof(int16_t));
    
    vector.x += (x/4);
    vector.y += (y/4);
    vector.z += (z/4);
    
    vector.x = ofClamp(vector.x, 0, ofGetWidth());
    vector.y = ofClamp(vector.y, 0, ofGetHeight());
    vector.z = ofClamp(vector.z, -100, 100);
    
    
}
