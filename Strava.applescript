-- Strava API documentation: http://strava.github.io/api/

-- Set a few global variables because I'm lazy, please don't touch
global scriptStart, scriptEnd, myID, unit

on run (arguments)
	-- grab arguments from input
	set myID to item 1 of arguments
	set token to item 2 of arguments
	set unit to item 3 of arguments
	set yDistGoal to item 4 of arguments
	
	set scriptStart to "curl -G https://www.strava.com/api/v3/athlete"
	set scriptEnd to " -H 'Authorization: Bearer " & token & "'"
	set wDistGoal to yDistGoal / 52
	set wNumber to (do shell script "date '+%V'") as number
	set dGoal to wDistGoal / 7
	set dNumber to (do shell script "date '+%u'") as number
	
	
	
	------------------------------------------------
	---------------MAIN CALCULATIONS----------------
	------------------------------------------------
	
	
	try
		set wDistance to getwDistance()
		set wProgress to makePercent(wDistance / wDistGoal)
		set wGoal to makePercent((dNumber * dGoal) / wDistGoal)
		set yDistance to getyDistance()
		set yProgress to makePercent(yDistance / yDistGoal)
		set yGoal to makePercent((wNumber * wDistGoal) / yDistGoal)
		
		if unit is "M" then
			set wDistance to toMiles(wDistance)
			set yDistance to toMiles(yDistance)
		end if
		
		return Â
			wDistance & space & unit & "~" & Â
			wProgress & "~" & Â
			wGoal & "~" & Â
			yDistance & space & unit & "~" & Â
			yProgress & "~" & Â
			yGoal Â
				as string
	on error e
		logEvent(e)
		return "NA"
	end try
end run


------------------------------------------------
---------------SUBROUTINES GALORE---------------
------------------------------------------------



on getwDistance()
	set wDistance to 0
	try
		set wDistanceRaw to do shell script scriptStart & "/activities" & scriptEnd & " -d after=" & (do shell script "date -v-Mon -v 0H -v 0M -v 0S +%s")
		set AppleScript's text item delimiters to "\"distance\":"
		set wDistanceRaw to text items 2 thru -1 of wDistanceRaw
	on error e
		logEvent(e)
		set AppleScript's text item delimiters to ""
		return 0
	end try
	repeat with aDay in wDistanceRaw
		set AppleScript's text item delimiters to ","
		set aDistance to text item 1 of aDay
		set wDistance to (aDistance / 1000) + wDistance
	end repeat
	set AppleScript's text item delimiters to ""
	return roundThis(wDistance)
end getwDistance

on getyDistance()
	try
		set totalsRaw to do shell script scriptStart & "s/" & myID & "/stats" & scriptEnd
		set AppleScript's text item delimiters to "ytd_ride_totals\":{\"count\""
		set totalsRaw to text item 2 of totalsRaw
		set AppleScript's text item delimiters to ":"
		set totalsRaw to text item 3 of totalsRaw
		set AppleScript's text item delimiters to ","
		set yDistance to (text item 1 of totalsRaw) / 1000
		set AppleScript's text item delimiters to ""
		return roundThis(yDistance)
	on error e
		logEvent(e)
		return 0
	end try
end getyDistance

on makePercent(thisNumber)
	return roundThis(thisNumber * 100) & "%" as string
end makePercent

on roundThis(n)
	set x to 10 ^ 1
	set y to (((n * x) + 0.5) div 1) / x
	set AppleScript's text item delimiters to "."
	set y1 to text item 1 of (y as string)
	set y2 to text item 2 of (y as string)
	set AppleScript's text item delimiters to ""
	if y2 starts with 0 then
		set dot to ""
		set y2 to ""
	else
		set dot to "."
	end if
	return (y1 & dot & y2) as number
end roundThis

on toMiles(n)
	return roundThis(n * 0.621371)
end toMiles

on logEvent(e)
	tell application "Finder" to set myName to (name of file (path to me))
	do shell script "echo '" & (current date) & space & quoted form of (e as string) & "' >> ~/Library/Logs/" & myName & ".log"
end logEvent
