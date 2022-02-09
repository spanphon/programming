#########
# Loops #
#########


#
# Initial setup
# 
# - We will set up some string variables that 
#   will make it easier to program the loop 
#     - path$: the relative path to the dir 
#       where we keep the files. 
#     - outputDir$: the relative path to the 
#       dir where we want to keep the output 
#       .csv file.
# - We will also create the .csv file where 
#   the output will go. We have to include 
#   the variables we want (the column names).


# Set path to folder where files are
path$ = "./MM01/"

# Create output file and set header
sep$ = ","

writeFileLine: "./data/data.csv",
  ..."info"       + sep$ +
  ..."durationV"  + sep$ + 
  ..."f0"         + sep$ +
  ..."f1"         + sep$ +
  ..."f2"         + sep$ +
  ..."f3"





#
# Prepare loop
#

# Go to folder where files are located, create list
Create Strings as file list: "fileList", path$ + "*.wav"

# Select the object fileList
selectObject: "Strings fileList"

# Count # of files and assign total to 'numFiles'
numFiles = Get number of strings

#
# Start loop
#

for i from 1 to numFiles

		# Select string, read in files
		select Strings fileList
		fileName$ = Get string... i
		prefix$ = fileName$ - ".wav"
		Read from file... 'path$'/'prefix$'.wav
		Read from file... 'path$'/'prefix$'.TextGrid


		# Calculate mid-point of vowel
		vowelStart = Get time of point: 1, 1
		vowelEnd = Get time of point: 1, 2
		durationV = vowelEnd - vowelStart
		mp = vowelStart + (durationV * 0.50)


    # Get f0 at midpoint
		select Sound 'prefix$'
		To Pitch: 0, 75, 600
		f0 = Get value at time: mp, "Hertz", "Linear"


		# Get formants
		select Sound 'prefix$'
		do ("To Formant (burg)...", 0, 5, 5500, 0.025, 50)
		f1 = do ("Get value at time...", 1, mp, "Hertz", "Linear")
		f2 = do ("Get value at time...", 2, mp, "Hertz", "Linear")
		f3 = do ("Get value at time...", 3, mp, "Hertz", "Linear")

		# Append data to .csv file
		fileappend "./data/data.csv" 'prefix$','durationV:2','f0:2','f1:2','f2:2','f3:2''newline$'

		# Printline for bug fixes (comment out for speed)
		printline 'prefix$','durationV:2','f0:2','f1:2','f2:2','f3:2'


		# Clean up
		select all
		minus Strings fileList
		Remove
endfor

# Clean objects
select all
Remove

