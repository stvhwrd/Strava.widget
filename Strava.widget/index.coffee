# Code originally created by the awesome members of Ubersicht community.
# I stole from so many I can't remember who you are, thank you so much everyone!
# Haphazardly adjusted and mangled by Pe8er (https://github.com/Pe8er)

options =
  # Your Strava user ID. It's at the end of your profile page URL.
  myid          :         "7217285"
  # Your Strava authorization token. Get one here: https://www.strava.com/settings/api. If you keep using mine, you will see my stats. Those aren't very impressive :)
  token         :         "545a5f91ea156a7a415f8ea985c277a2808f5caf"
  # Distance units: KM for kilometers or M for miles.
  units         :         "KM"
  # Your yearly biking goal in kilometers.
  yearlygoal    :         "4000"
  # Vertical distance from top left corner of the screen. Set it to 0 if you're using this widget within Sidebar meta-widget. No need to put it inside Sidebar folder!
  top           :         "0"
  # Horizontal distance from top left corner of the screen. Set it to 0 if you're using this widget within Sidebar meta-widget. No need to put it inside Sidebar folder!
  left          :         "0"

refreshFrequency:         '1h'

command: "osascript Strava.widget/Strava.applescript #{options.myid} #{options.token} #{options.units} #{options.yearlygoal}"

style: """

  white1 = rgba(white,1)
  white05 = rgba(white,0.5)
  white02 = rgba(white,0.2)

  top #{options.top}px
  left #{options.left}px
  width 176px
  overflow hidden
  white-space nowrap
  position relative
  -webkit-backdrop-filter blur(20px) brightness(70%) contrast(120%) saturate(140%)
  font-family system, -apple-system
  opacity 0
  display none

  *, *:before, *:after
    box-sizing border-box

  .wrapper
    font-size 8pt
    line-height 11pt
    color white
    padding 8px
    height auto

  .week, .year
    width 100%
    margin-bottom 4px

  .left
    opacity 0.5
    float left

  .wDistance, .yDistance
    display block
    margin 0 0 0 auto
    font-weight 700
    text-align right

  .bars
    margin 4px 0 8px 0
    height 8px
    position relative

  .bar, .progress, .goal
    top 0
    left 0
    background-color white02
    height 8px
    width 100%
    max-width 100%
    min-width 0%
    z-index 1
    position absolute

  .goal
    background-color white02
    z-index 2
    width 2%

  .progress
    background-color white
    z-index 3
    width 1%
"""

render: (output) ->
  # Initialize our HTML.
  stravaHTML = ''

  # Create the DIVs for each piece of data.
  stravaHTML = "
    <div class='wrapper'>
      <div class='week'>
        <span class='left'>Week</span>
        <span class='wDistance'>No Data</span>
        <div class='bars'>
          <div class='bar'></div>
          <div class='bar progress'></div>
          <div class='bar goal'></div>
        </div>
      </div>
      <div class='year'>
        <span class='left'>Year</span>
        <span class='yDistance'>No Data</span>
        <div class='bars'>
          <div class='bar'></div>
          <div class='bar progress'></div>
          <div class='bar goal'></div>
        </div>
      </div>
     </div>"
  return stravaHTML

# Update the rendered output.
update: (output, domEl) ->

  # Get our pieces.
  values = output.slice(0,-1).split("~")

  # Get our main DIV.
  div = $(domEl)

  # Initialize our HTML.
  stravaHTML = ''

  if values[0] != "NA"

    # Define variables
    wDistance = values[0]
    wProgress = values[1]
    wGoal = values[2]
    yDistance = values[3]
    yProgress = values[4]
    yGoal = values[5]

    # Update text values
    div.find('.wDistance').html(wDistance)
    div.find('.yDistance').html(yDistance)

    # Update bar widths
    div.find('.week .progress').css('width', wProgress)
    div.find('.week .goal').css('width', wGoal)
    div.find('.year .progress').css('width', yProgress)
    div.find('.year .goal').css('width', yGoal)

    # Show the damn thing!
    div.css('display', 'block')
    div.animate({ opacity: 1 }, 250)
  else
    div.css('display', 'none')
    div.animate({ opacity: 0 }, 250)

  # Sort out flex-box positioning.
  div.parent('div').css('order', '4')
  div.parent('div').css('flex', '0 1 auto')