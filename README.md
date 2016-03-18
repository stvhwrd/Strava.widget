# Strava Progress Tracker for [Übersicht](http://tracesof.net/uebersicht/)

![](https://github.com/Pe8er/Strava.widget/blob/master/screenshot.png)

## [Download](https://github.com/Pe8er/Strava.widget/raw/master/Strava.widget.zip)

This widget grabs your weekly and yearly biking stats from [Strava](https://www.strava.com/) and displays them in a somewhat visual manner.

![Instructions](http://imgur.com/nGiCWi2.jpg)

## How to Use

1. Extract and copy `Strava.widget` folder in `~/Library/Application Support/Übersicht/Widgets` folder.
1. Open `Strava/widget/index.coffee` in a text editor.
2. Edit values in lines 7-13 to set your preferences.

```
options =
  # Your Strava user ID. It's at the end of your profile page URL.
  myid          :         "7217285"
  # Your Strava authorization token. Get one here: https://www.strava.com/settings/api
  token         :         "545a5f91ea156a7a415f8ea985c277a2808f5caf"
  # Distance units: KM for kilometers or M for miles.
  units         :         "KM"
  # Your yearly biking goal in kilometers.
  yearlygoal    :         "4000"
```

If you don't edit these, the widget will show my statistics. (Which aren't that impressive at all!)

It supports flex positioning, easy background blur and tons of probably very poorly written code.

[See my other widgets](https://github.com/Pe8er/Ubersicht-Widgets)