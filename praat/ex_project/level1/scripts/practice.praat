################
#              #
# Praat basics #
#              #
################

###################
# Getting started #
###################

# Download file, place on desktop 
https://dl.dropboxusercontent.com/u/7256527/ex_project.zip
http://tinyurl.com/gl4ve8p

# Create a new script
# Praat > New Praat script






























######################
# Scripting commands #
######################

# Create a sound object, call it 'mySound', and then play it
Play
Play

# Now pay attention to what this does
Erase all
Play
Play
Draw inner box
Text: 0, "Centre", 0, "Half", "Hello world"

# Praat is a procedural language
# Each command is executed in the order it is entered


















####################
# Settings windows #
####################

# You can do anything in a script that you can do from 
# a window. This can be cumbersome though because you must 
# enter all of the relevant arguments.
#
# To get the name of a command, look in any window for "...".
# For example, select your sound object and click "Draw..." 
# in the "Draw" menu. Now compare the arguments to the 
# following command. Close the picture window and then run 
# the command.

# Draw command
Erase all
Draw: 0, 0, 0, 0, "yes", "Curve"

# Draw command with different args
Draw: 0, 0, -1, 2, "yes", "Speckles"

# Create a pure tone (New > Sound > Create Sound from formula)
Create Sound from formula: "sine", 1, 0, 1, 44100, "1/2 * sin(2*pi*377*x)"

# Notice that the 'Name' and 'Formula' variables must be written 
# within quotes because they are text arguments.














####################
# String variables #
####################

# A string variable is the equivalent of a character 
# vector in R. String variables must begin with a 
# lowercase letter and end with "$".

var1$ = "Hello"
var2$ = "world!"

# Printing
writeInfoLine: var1$
writeInfoLine: var2$

# Appending (gives error)
writeInfoLine: var1$
appendInfoLine: var2$

# Praat only saves objects to memory
# for as long as the script is running
var1$ = "Hello"
var2$ = "world!"
writeInfoLine: var1$
appendInfoLine: var2$


















#####################
# Numeric variables #
#####################

# We store numeric variables in the same way as string variables, 
# but we do not include the "$". 

x = 100
writeInfoLine: x

# We can combine strings and numerics
y = 35
z = 5
writeInfoLine: "Thirty-five plus five = ", y + z

# We can evaluate the object before it is assigned
val = 35 + 5
writeInfoLine: val





















###################
# Numeric queries #
###################

# We can query a selected object the same way we do from the 
# spectrogram window. 

selectObject: "Sound mySound"
To Formant (burg): 0, 5, 5500, 0.025, 50
Get value at time: 1, 0.5, "Hertz", "Linear"

# You might be thinking "Cool. But how do I know what scripting 
# command to use in order to get the information I can get manually 
# from the window?". Good question. You can execute any command 
# manually and then check the actual syntax by using 'paste history' 
# (Edit > Paste history; or command + H).

























##################
# File arguments #
##################

# COMPLETE PATHS
# When writting scripts you will often have to refer 
# to the PATH to where your folders and files of interest 
# are located on your computer. They way you write the 
# path depends on what type of computer you have. 

# For windows
Read from file: "C:/Users/userName/folder/file.wav"

# For Mac
Read from file: "/Users/userName/folder/file.wav"

# You can get rid of the "Users/userName" part by including the tilde:
Read from file: "~/folder/file.wav"

# Save the sound object 'mySound' to your desktop and load it using 
# the complete path.























# RELATIVE PATHS
# All the above examples show COMPLETE PATHS. It is 
# often much easier to use a RELATIVE PATH. This means 
# that the path to your file is determined by the location 
# of the current file (this script). We use periods to 
# move to different directories. One period (".") refers to 
# the current directory. Two periods ("..") moves up to the 
# parent directory. Save this script to 'ex_project' with the 
# name 'myScript.praat'. Move 'mySound.wav' to 'ex_project'. 
# Now open the sound from the script:

Read from file: "mySound.wav"

# This is the same as:
Read from file: "./mySound.wav"

# Now create a folder called "level1" inside of 'ex_project'. 
# Leave your script where it is (inside 'ex_project'), 
# but move 'mySound.wav' inside 'level1'. We can read the 
# file like so:

Read from file: "./level1/mySound.wav"

# Create a folder inside of 'level1'. Call it 'level2'. 
# Move 'mySound.wav' into 'level2'. How can we read it into 
# Praat?

Read from file: "./level1/level2/mySound.wav"

# Now create a folder inside of 'level1' called 'scripts'. 
# Close 'myScript.praat' and move it into 'scripts'.
# How can we open 'mySound.wav'?
#
#       Desktop 
#          |
#        ex_project 
#          |       \      
#        level1     MM01 
#       /      \
# level2       scripts
#    |            |
# mySound.wav   myScript.praat















Read from file: "../level2/mySound.wav"





































#########
# Loops #
#########

start = 1
stop = 5000

for i from start to stop
	writeInfoLine: i
endfor



# Set path to folder where files are
path$ = "./MM01/"

# Go to the folder where all the files are, create a list of all files
Create Strings as file list: "fileList", path$ + "*.wav"

# Select the object fileList
selectObject: "Strings fileList"

# Save the number of files to the variable 'numFIles'
numFiles = Get number of strings

# Create a practice loop
for i from 1 to numFiles
	Get string: i
	writeInfoLine: i
endfor
























