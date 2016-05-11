% a clean house is a happy house
clear all; close all; clc;

% add the path of the simulation pre-reqs
addpath(genpath('./Simulation Files'));
addpath(genpath('./Graphical User Interfaces'));

% load current human path command
load('./Simulation Files/Human Path Command/humanPath.mat');

% load camera noise files
load('./Simulation Files/Sensor Noise/noise.mat');

% load ICs
load('./Simulation Files/Initial Conditions/Hover.mat');

% load QC path command (won't be needed soon)
load('./Simulation Files/Path Command Files/Path_Triangle.mat');

% load QC structure
load('./Simulation Files/Quadcopter Structure Files/quadModel_+.mat');

% open my current simulink model
open_system('./Simulation Files/Block Library/humanMovementTest.slx');