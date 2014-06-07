// DO NOT OPEN THIS FILE DIRECTLY IN THE IDE: OPEN MotorTestingProgram_vX_X instead and this will appear as a tab
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// This mode is intended to allow simple calibration of the ESC's to the signal limits being used by the Arduino. It was
// developed using a Turnigy brand "Plush" brushless motor ESC, but many other ESC's use very similar calibration routines.
// Consult your ESC's instructions (if you are fortunate enough to have any) for more information on how this proceedure
// should be performed, and modify the code as needed using the code below as an example.
// To adjust range of signal widths, adjust value of "lowServo" and "highServo". Note that the Arduino has limitations
// on supported servo signal lengths, so these should only be changed with these limitations in mind. 
// See the Arduino Servo.h library code for more information.
void calibrationMode(){
  Serial.println(" ");
  Serial.println("Starting Calibration Mode...");
  m1.writeMicroseconds(lowServo);
  Serial.println("Type 1 to exit calibration mode:");
  Serial.println("FIRST, DISCONNECT ESC'S FROM POWER!! Then type -1 to continue with calibration.");
  while (Serial.available() <= 0) {} // Wait till user responds before doing anything
  incomingByte = Serial.parseInt(); // read the incoming byte:
  if (incomingByte == -1) {
    Serial.println("ALL THROTTLES BEING SET TO 100%");
    delay(2000); // pause to let people react if it's a mistake (i.e. get away from the motor)
    m1.writeMicroseconds(highServo);
    Serial.println("CONNECT POWER TO ESC:");
    Serial.println("WHEN ESC EMITS TWO BEEPS, IMMEDIATELY ENTER ANYTHING (E.G. 0) TO SET MOTORS TO ZERO"); // This is based on the standard "Two Beep" 
    //ESC calibration method. This whole proceedure may need to be adjusted if your ESC requires some other type of calibration.
    while (Serial.available() <= 0) {
    } // Wait till user responds before doing anything
    m1.writeMicroseconds(lowServo);
    delay(1000);
    Serial.println("Motor Speed set to zero");
    Serial.println("ESC's should now have throttle calibrated for Arduino signals. Returning to regular operation...");
    Serial.println(" ");
    instructFlag = HIGH;
  }
  else {
    m1.writeMicroseconds(lowServo);
    instructFlag = HIGH;
    timeNow = micros(); // get current time in MICROSECONDS. Used on next print command (assuming no blade pass interrupt occurs first)
    printFlag = 1;
  }
}
