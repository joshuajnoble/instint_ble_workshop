#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup()
{
    //rfduinoManager = RFduinoManager.sharedRFduinoManager;
    
    last = 0;
    
    rfduinoImpl = [[ofxRFduinoDelegate alloc] init];
    [rfduinoImpl setApplication:this];
    
    touchPosition[ 0 ] = ofVec2f(-1, -1);
    touchPosition[ 1 ] = ofVec2f(-1, -1);
    touchPosition[ 2 ] = ofVec2f(-1, -1);
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    if( touchPosition[0].x > 0) {
        ofCircle(touchPosition[0], 20);
    }
    if( touchPosition[1].x > 0) {
        ofCircle(touchPosition[1], 20);
    }
    if( touchPosition[2].x > 0) {
        ofCircle(touchPosition[2], 20);
    }
    
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch)
{
    if(touch.id < 3)
    {
        touchPosition[ touch.id ] = touch;
        int floored = (int) ofMap(touch.y, 0, ofGetHeight(), 0, 255);
        rgb[touch.id] = (unsigned char) floored;
        if( ofGetElapsedTimeMillis() - last > 250 )
        {
            ofxRFDSendData(rfduinoImpl, &rgb[0], 3);
            last = ofGetElapsedTimeMillis();
        }
    }
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
    if(touch.id < 3)
    {
        touchPosition[ touch.id ] = touch;
        int floored = (int) ofMap(touch.y, 0, ofGetHeight(), 0, 255);
        rgb[touch.id] = (unsigned char) floored;
        if( ofGetElapsedTimeMillis() - last > 250 )
        {
            ofxRFDSendData(rfduinoImpl, &rgb[0], 3);
            last = ofGetElapsedTimeMillis();
        }
    }
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
    if(touch.id < 3)
    {
        touchPosition[ touch.id ] = ofVec2f(-1, -1);
    }
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
    ofxRFDConnectRFduino(rfduino);
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
    cout << " got some data! " << endl;
}
