/* Motor Testing Program v1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
This program is intended for use on an Arduino Uno R3 for testing the 
performance of quadcopter motors. This is the main file and must be opened
in the IDE, which should automatically open the other "tabs" called
"Calibration_Mode", "ISRs", "SerialPrint_Functions", and "Step_Testing".

    Additional quadcopter modeling and simulation materials available at:
    github.com/dch33/Quad-Sim

Copyright (C) 2014 D. Hartman

License:
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU LESSER GENERAL PUBLIC LICENSE as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU LESSER GENERAL PUBLIC LICENSE
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  This program is intended to allow Serial Monitor control of an Arduino (tested on UNO) for
  use in testing the response of a multicopter motor and ESC for the purpose of control design and simulation.
  See provided documentation for wiring instructions and warnings.
  
  *WARNING: MULTICOPTER MOTORS AND EQUIPMENT ARE DANGEROUS AND CAN BEHAVE UNPREDICTABLY! USE CAUTION!
  OBEY ALL ORIGINAL EQUIPMENT MANUFACTURER INSTRUCTIONS AND WARNINGS, AND USE APPROPRIATE SAFETY EQUIPMENT
  AND PRACTICES. ANY TIME POWER IS APPLIED TO THE ESC AND THE MOTOR IS CONNECTED, THE MOTOR AND ROTOR SHOULD 
  NOT BE CONSIDERED SAFE.

  Wiring Layout: For required circuit schematic, see provided documentation. 
  From light circuit: High pin to pin 3, low pin to pin 2
  From ESC: Signal wire (normally white) to pin 10

*/

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// HEADER FILES
#include <Servo.h>
//-------------------------------------------------------------------------------------------------------------------------
// PIN DECLARATIONS
#define MOTOR_PIN 10 // Pin that signal to motor ESC will be sent from
// Interrupt Signal Pins
const byte lowPin = 0; // On DIGITAL PIN 2 for UNO!
const byte highPin = 1; // On DIGITAL PIN 3 for UNO!
//-------------------------------------------------------------------------------------------------------------------------
// CLASS INSTANCES
Servo m1; // Name for motor object
//-------------------------------------------------------------------------------------------------------------------------
// FLAGS AND PIN STATES
//bool pulseFlag = LOW; // Used for counting pulses, LOW = Not on a peak, HIGH = on a peak
bool instructFlag = HIGH; // Flag for display of Instructions. HIGH is on (display instructions), LOW is off
bool printFlag = LOW; // Flag for controlling the serial printing of time, motor speed, and RPM data.
//-------------------------------------------------------------------------------------------------------------------------
// MOTOR CONTROL VARIABLES
byte m1Throttle = 0; // Throttle setting for motor; between 0 and 100%;
unsigned int m1Signal = 0; // Actual pulse length to send to motor
const unsigned int lowServo = 1000; // Lower servo signal limit, in microseconds, 1000 default
const unsigned int highServo = 2000; //upper servo signal limit, in microseconds, 2000 default
//-------------------------------------------------------------------------------------------------------------------------
// CONVERSION NUMERICAL VALUES
const byte numBlades = 2; // How many blades does your rotor have? Used to convert from pulses to RPM
const unsigned long RPMconversion = 60000000/numBlades; //Used in converting pulses to RPM, DECLARE AS A DOUBLE TYPE IF YOU HAVE MORE THAN 6 BLADES
//-------------------------------------------------------------------------------------------------------------------------
// INTERRUPT TIME VARIABLES
volatile unsigned long timeNow = 0;
volatile unsigned long timeLast = 0;
volatile unsigned long deltaT = 0;
//-------------------------------------------------------------------------------------------------------------------------
// COM RELATED VARIABLES
int incomingByte = 0; // storage variable for incoming serial data (Used for throttle and mode selection)
byte printReductionFactor = 1; //Factor for reducing the frequency of print events from blade crossings. (1 prints every crossing, 2 prints every other crossing, etc.)
byte printCount = 1; // Used in conjunction with printReductionFactor to reduce print events from blade crossings
unsigned int RPM = 0; // 
//-------------------------------------------------------------------------------------------------------------------------
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
void setup() {
  Serial.begin(115200);
  attachInterrupt(lowPin, bottomState,FALLING); // Create interrupt to detect a blade crossing
  m1.attach(MOTOR_PIN);  // attaches the motor to pin
  m1.writeMicroseconds(lowServo+5); // start arming sequence ( low output for a short time)
  delay(1000);
  m1.writeMicroseconds(lowServo);
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
void loop() {
  // Print Instructions if appropriate
  if (instructFlag == HIGH){
    printInstructions();
  }
  // Check to see if user has input a new serial command
  if (Serial.available() > 0) {
    getSerialInput(); // If there's new input get it and act accordingly
  }
  // Print current data if either (a) Motor speed was updated, or (b) A pulse was counted. printFlag carries this information
  if (printFlag == HIGH){
    RPM = round(((double)RPMconversion)/((double)deltaT)); // Calculate RPM (might be a faster/better way to do this calculation)
    printData();
  }
}
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// This function interprets incoming serial input commands and executes the appropriate function
void getSerialInput(){
  incomingByte = Serial.parseInt(); // read the incoming byte: (will not recognize decimal numbers e.g. 25.4)
  if (incomingByte >= 0){
    getMotorSpeed();
  }
  else if (incomingByte == -1) {
    stepMode();
  }
  else if (incomingByte == -2) {
    calibrationMode();
  }
}
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// This function takes the incoming serial value and sets the motor to a corresponding value. If decimal percent throttle values 
// are desired, the map() function will have to be removed and the Serial.parseInt() input parsing replaced by a different approach.
void getMotorSpeed(){ //get motor speed from serial input
  m1Throttle = constrain(incomingByte, 0, 100);
  m1Signal = map(m1Throttle, 0, 100, lowServo, highServo); // Map throttle from 0-100% of full servo range, only works on integers due to "map()" limitations
  setMotorSpeed();
}
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Simply sets the motor speed to the currently stored signal value. Also stored current time in timeNow for printing purposes.
void setMotorSpeed(){
  m1.writeMicroseconds(m1Signal); // set new speed for motor
  timeNow = micros(); // get current time in MICROSECONDS. Used on next print command (assuming no blade pass interrupt occurs first)
  printFlag = HIGH; // Print out updated data this loop
}


