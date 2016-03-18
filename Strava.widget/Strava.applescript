-- this is for testing
--my test({"7217285", "545a5f91ea156a7a415f8ea985c277a2808f5caf", "KM", "4000"})

-- Strava API documentation: http://strava.github.io/api/

-- Set a few global variables because I'm lazy, please don't touch --
global scriptStart, scriptEnd, myID, unit

-- Set options below --
on run (arguments)
	set myID to item 1 of arguments
	set token to item 2 of arguments
	set unit to item 3 of arguments
	set yDistGoal to item 4 of arguments
	
	(*
set myID to "7217285" -- your Strava user ID
set token to "545a5f91ea156a7a415f8ea985c277a2808f5caf" -- your Strava authorization token. Get one here: https://www.strava.com/settings/api
set unit to "KM" -- distance units (KM or M)
set yDistGoal to 4000 -- your yearly biking goal
*)
	
	set scriptStart to "curl -G https://www.strava.com/api/v3/athlete"
	set scriptEnd to " -H 'Authorization: Bearer " & token & "'"
	set wDistGoal to yDistGoal / 52
	set wNumber to (do shell script "date '+%V'") as number
	set dGoal to wDistGoal / 6 -- biking 6 days a week + 1 day of recovery
	set dNumber to (do shell script "date '+%u'") as number
	
	
	
	------------------------------------------------
	---------------MAIN CALCULATIONS----------------
	------------------------------------------------
	
	
	
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
end run


------------------------------------------------
---------------SUBROUTINES GALORE---------------
------------------------------------------------



on getwDistance()
	set wDistance to 0
	set wDistanceRaw to do shell script scriptStart & "/activities" & scriptEnd & " -d after=" & (do shell script "date -v-Mon -v 0H -v 0M -v 0S +%s")
	set AppleScript's text item delimiters to "\"distance\":"
	set wDistanceRaw to text items 2 thru -1 of wDistanceRaw
	repeat with aDay in wDistanceRaw
		set AppleScript's text item delimiters to ","
		set aDistance to text item 1 of aDay
		set wDistance to (aDistance / 1000) + wDistance
	end repeat
	set AppleScript's text item delimiters to ""
	return roundThis(wDistance)
end getwDistance

on getyDistance()
	set totalsRaw to do shell script scriptStart & "s/" & myID & "/stats" & scriptEnd
	set AppleScript's text item delimiters to "ytd_ride_totals\":{\"count\""
	set totalsRaw to text item 2 of totalsRaw
	set AppleScript's text item delimiters to ":"
	set totalsRaw to text item 3 of totalsRaw
	set AppleScript's text item delimiters to ","
	set yDistance to (text item 1 of totalsRaw) / 1000
	set AppleScript's text item delimiters to ""
	return roundThis(yDistance)
end getyDistance

on makePercent(thisNumber)
	return roundThis(thisNumber * 100) & "%" as string
end makePercent

on roundThis(n)
	set x to 10 ^ 1
	(((n * x) + 0.5) div 1) / x
end roundThis

on toMiles(n)
	return roundThis(n * 0.621371)
end toMiles