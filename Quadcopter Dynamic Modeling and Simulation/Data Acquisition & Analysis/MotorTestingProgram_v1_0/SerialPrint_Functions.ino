// DO NOT OPEN THIS FILE DIRECTLY IN THE IDE: OPEN MotorTestingProgram_vX_X instead and this will appear as a tab
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Prints out most recent data for recording
void printData(){
  Serial.print( timeNow*0.000001, 3); // Print last time stamp
  Serial.print("\t");
  Serial.print(m1Throttle); // Print motor percent throttle setting
  Serial.print("\t");
  Serial.println(RPM); // Print motor RPM
  printFlag = LOW; // Don't print again unless another function changes the state of this flag.
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Prints out basic instructions and column headings
void printInstructions(){
  Serial.println(" ");
  Serial.println("Type desired motor percent throttle (must be integer between 0 and 100).");
  Serial.println("Alternatively for: ");
  Serial.println("STEP RESPONSE MODE: Enter \"-1\" (See Instructions)");
  Serial.println("ESC THROTTLE CALIBRATION MODE: Enter \"-2\"");
  Serial.print("Seconds"); Serial.print("\t");
  Serial.print("Throttle"); Serial.print("\t");
  Serial.println("RPM");
  instructFlag = LOW; // Don't print instructions again:
}
