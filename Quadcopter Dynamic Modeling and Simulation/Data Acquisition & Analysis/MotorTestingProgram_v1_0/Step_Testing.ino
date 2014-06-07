// DO NOT OPEN THIS FILE DIRECTLY IN THE IDE: OPEN MotorTestingProgram_vX_X instead and this will appear as a tab
// This mode is intended to allow step tests to be perfomed on the motor. The resulting data can then be used to fit a first-
// order timeconstant (called TC in associated analysis program). See documentation for more information.
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
void stepMode(){
  // Local Variables
  const byte lowTime = 5; // Time to spend at low throttle setting during step test, seconds
  const byte highTime = 5; // Time to spend at high throttle setting during step test, seconds
  //-------------------------------------------------------------------------------------------------------------------------
  m1.writeMicroseconds(lowServo); // Start by setting motor throttle signal to lowest value
  Serial.println(" ");
  Serial.println("Entering Step input mode...");
  Serial.println("Step mode is for measuring the step response of the motor.");
  Serial.println("Type the starting percent throttle:");
  while (Serial.available() <= 0) {} // Wait till user responds before doing anything
  incomingByte = Serial.parseInt(); // read the incoming byte:
  byte stepLow = constrain(incomingByte, 0, 100); // Constrain input to percentage throttle
  Serial.println("Type the percent throttle you wish to step to:");
  while (Serial.available() <= 0) {} // Wait till user responds before doing anything
  incomingByte = Serial.parseInt(); // read the incoming byte:
  byte stepHigh = constrain(incomingByte, 0, 100); // Constrain input to percentage throttle
  Serial.println("Confirm the step values you have entered are correct:"); // Allow confirmation of values
  Serial.print("Initial Throttle: ");
  Serial.print(stepLow);
  Serial.print("\t");
  Serial.print("Step Throttle: ");
  Serial.println(stepHigh);
  Serial.print("Motor Speed will be stepped low for ");
  Serial.print(lowTime); Serial.print(" seconds then stepped high for ");
  Serial.print(highTime); Serial.println(" seconds.");
  Serial.println("If these values are acceptable, type \"1\". To abort Step Input Mode, type \"-1\"");
  Serial.println(" ");
  while (Serial.available() <= 0) {} // Wait till user responds before doing anything
  incomingByte = Serial.parseInt(); // read incoming byte
  if (incomingByte ==1){ // This runs the step test as programmed
    runStep(stepLow,stepHigh,lowTime,highTime);
    instructFlag = HIGH;
  }
  else{ // This returns to the main instruction set and the main loop of the program
    instructFlag = HIGH;
  }
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// This function performs the actual step test.
void runStep(byte stepLow, byte stepHigh, byte lowTime, byte highTime){
  //-------------------------------------------------------------------------------------------------------------------------
  // Local Variables
  const byte spinDownDelay = 5; // Time to allow return to low stepLow value after step test, seconds
  double stepLowSignal = 0, stepHighSignal = 0, startTime = 0;
  byte stepFlag = 1, lowFlag = 1, highFlag = 1, delayFlag = 1;
  //-------------------------------------------------------------------------------------------------------------------------
  Serial.println("Step Mode Beginning In 5 Seconds!");
  Serial.print("Seconds");
  Serial.print("\t");
  Serial.print("Throttle");
  Serial.print("\t");
  Serial.println("RPM");
  m1.writeMicroseconds(lowServo);
  stepLowSignal = map(stepLow, 0, 100, lowServo, highServo); // Maps step low and step high values from percent throttle to servo-signal lengths
  stepHighSignal = map(stepHigh, 0, 100, lowServo, highServo);
  delay(5000);
  startTime = micros()*0.000001; // Get starting time in seconds
  
  // While loop to perform the step test
  while (stepFlag == 1){
    double currentTime = micros()*0.000001-startTime; // Get elapsed time since start in seconds
    if ( (lowFlag == 1) && ( currentTime < lowTime) ){ // This runs ONCE to setup the low signal state
      m1Throttle = stepLow; // Set throttle to low value (needed for printed value to appear correctly)
      m1Signal = stepLowSignal; 
      m1.writeMicroseconds(m1Signal);
      lowFlag = 0; // set flag so this code is only executed once
      timeNow = micros(); // get current time in MICROSECONDS. Used on next print command (assuming no blade pass interrupt occurs first)
      printFlag = 1; // Force print to indicate output signal is changing
    }
    else if ( (highFlag == 1) && ( currentTime >= lowTime ) && ( currentTime < (lowTime+highTime))){ // This runs ONCE to setup the high signal state
      m1Throttle = stepHigh; // Set throttle to high value (needed for printed value to appear correctly)
      m1Signal = stepHighSignal;
      m1.writeMicroseconds(m1Signal);
      highFlag = 0; // set flag so this code is only executed once
      timeNow = micros();// get current time in MICROSECONDS. Used on next print command (assuming no blade pass interrupt occurs first)
      printFlag = 1; // Force print to indicate output signal is changing
    }
    else if ( (delayFlag ==1) && (currentTime > (lowTime+highTime)) && (currentTime <= (lowTime+highTime+spinDownDelay))){ // This runs once to setup the delay state
      m1Throttle = stepLow; // Set throttle to low value (needed for printed value to appear correctly)
      m1Signal = stepLowSignal;
      m1.writeMicroseconds(m1Signal);
      delayFlag = 0; // set flag so this code is only executed once
      timeNow = micros(); // get current time in MICROSECONDS. Used on next print command (assuming no blade pass interrupt occurs first)
      printFlag = 1; // Force print to indicate output signal is changing
    }
    else if (currentTime > (lowTime+highTime+spinDownDelay)){
      stepFlag = 0; // This exits the while loop
    }
    if (printFlag == 1){
    RPM = RPMconversion/deltaT;
    //RPM = round(((double)RPMconversion)/((double)deltaT)); ?
    printData();
    }
  }
  m1Throttle = 0;
  m1.writeMicroseconds(lowServo);
  Serial.println("Step input test complete. Returning to normal operation...");
  delay(5000); // Delay to allow motors to stop before returning to main loop...
}
