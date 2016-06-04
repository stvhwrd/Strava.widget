
# Strava Progress Tracker for [Übersicht](http://tracesof.net/uebersicht/)

![Screenshot](https://github.com/stvhwrd/Strava.widget/blob/master/screenshot.png)

## [Download](https://github.com/stvhwrd/Strava.widget/raw/master/Strava.widget.zip)

This widget displays your weekly and year-to-date cycling stats from [Strava](https://www.strava.com/).

<img src="https://github.com/stvhwrd/Strava.widget/blob/master/instructions.jpg" width="420" height="300">

## How to Use

1. Unzip and copy `Strava.widget` folder to `~/Library/Application Support/Übersicht/Widgets` folder.
1. Open `Strava/widget/index.coffee` in a text editor.
2. Edit values in lines 7-13 to set your preferences:

```
options =
  # Easily enable or disable the widget.
  widgetEnable  :         true
  # Your Strava user ID. It's at the end of your profile page URL.
  myid          :         "XXX"
  # Your Strava authorization token. Get one here: https://www.strava.com/settings/api. If you keep using mine, you will see my stats. Those aren't very impressive :)
  token         :         "XXXX"
  # Distance units: KM for kilometers or M for miles.
  units         :         "KM"
  # Your yearly biking goal in kilometers.
  yearlygoal    :         "4000"
  # Vertical distance from top left corner of the screen. Set it to 0 if you're using this widget within Sidebar meta-widget. No need to put it inside Sidebar folder!
  top           :         "0"
  # Horizontal distance from top left corner of the screen. Set it to 0 if you're using this widget within Sidebar meta-widget. No need to put it inside Sidebar folder!
  left          :         "0"
```

If you don't edit these, the widget will show my statistics. (Which aren't that impressive at all!)

It supports flex positioning, easy background blur and tons of probably very poorly written code.

This is a fork of Piotr Gajos' widget.  [See Pe8er's other widgets](https://github.com/Pe8er/Ubersicht-Widgets)
