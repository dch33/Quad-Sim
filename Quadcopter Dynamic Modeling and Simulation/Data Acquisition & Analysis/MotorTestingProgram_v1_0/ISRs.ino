// DO NOT OPEN THIS FILE DIRECTLY IN THE IDE: OPEN MotorTestingProgram_vX_X instead and this will appear as a tab
// These two ISR's (interrupt service routines) are used to capture blade passing events in conjunction with the 
// comparator circuit. See associated documentation for more information.
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
void bottomState() {
  detachInterrupt(lowPin); // Stop reading lowPin Falling events
  timeNow = micros(); // Get current time
  deltaT = timeNow-timeLast; // calculate change in time since last crossing event
  timeLast = timeNow; // store current time for next crossing event
  printFlag = 1; // print out test data during next main loop
  attachInterrupt(highPin, topState,RISING); // attach the highState pin to register when the blade shadow has fully left the phototransistor
}
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
void topState() {
  detachInterrupt(highPin); // Stop reading highPin rising events
  attachInterrupt(lowPin, bottomState, FALLING); //attach the bottomState pin to catch the next crossing
}

