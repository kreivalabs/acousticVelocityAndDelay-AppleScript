#version 1.1 / 31-October-2017

#A utility to calculate approximate acoustic velocity in air based on measured temperature in
#degrees Fahrenheit, as well as approximate speaker delay timings in milliseconds based on the
#measured distance between loudspeaker systems.

#Created to simplify the process of setting speaker delay timings for indoor performances of
#theater and small to mid-sized concerts in the absense of an RTA software package.

#Note: these calculation cannot take into account the ideal gas law and therefore do not reflect 
#air pressure or gas molecular density. The returned results are sufficient for most indoor
#measurements.

try
	display dialog "Enter temperature in degrees Fahrenheit" default answer "" with title "Acoustic Velocity Calculator"
	set myTemp to text returned of result as number
	
	display dialog "Enter measured distance between speakers in feet" default answer ""
	set myDistance to text returned of result as number
	
on error errmsg number errnbr
	my error_handler(errnbr, errmsg)
	return
end try

ignoring numeric strings
	set myCelcius to (myTemp - 32) / 1.8 as number
	set metersSeconds to (0.6 * myCelcius) + 331.4 as number
	set feetMiliseconds to metersSeconds * 0.00328084 as number
	set delayTime to myDistance / feetMiliseconds as number
	
end ignoring
display dialog "Approximate Acoustic Velocity is " & ((round (metersSeconds * 100)) / 100) & " m/s, or " & ((round (feetMiliseconds * 100)) / 100) & " ft/ms. Approximate delay time is " & ((round (delayTime * 100)) / 100) & " ms." as text
