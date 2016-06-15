
# Strava Progress Tracker for [Übersicht](http://tracesof.net/uebersicht/)

![Screenshot](https://github.com/stvhwrd/Strava.widget/blob/master/screenshot.png)

## [Download](https://github.com/stvhwrd/Strava.widget/raw/master/Strava.widget.zip)

This widget displays your weekly and year-to-date cycling stats from [Strava](https://www.strava.com/).

<img src="https://github.com/stvhwrd/Strava.widget/blob/master/instructions.jpg" width="420" height="300">

## How to Use

#### Option 1:  Zip file:

1. Unzip and copy `Strava.widget` folder to `~/Library/Application Support/Übersicht/widgets` folder.

2. Open `~/Library/Application Support/Übersicht/widgets/Strava.widget/index.coffee` in a text editor.

#### Option 2:  Git clone:

1. Open a Terminal window.

2. Execute command `cd ~/Library/Application Support/Übersicht/widgets`

3. Execute command `git clone https://github.com/stvhwrd/Strava.widget`

4. Open `~/Library/Application Support/Übersicht/widgets/Strava.widget/index.coffee` in a text editor.

<br>

In your text editor, edit the values on lines 9 - 19 to set your preferences:

```
options =
  # Easily enable or disable the widget.
  widgetEnable  :         true
  # Your Strava user ID. It's at the end of your profile page URL.
  myid          :         "XXX"
  # Your Strava authorization token. Get one here: https://www.strava.com/settings/api.
  token         :         "XXXX"
  # Distance units: KM for kilometers or M for miles.
  units         :         "KM"
  # Your yearly biking goal in kilometers.
  yearlygoal    :         "4000"
  # Vertical distance from top left corner of the screen. Set it to 0 if you're using this widget within Sidebar meta-widget. There is no need to put it inside Sidebar folder.
  top           :         "0"
  # Horizontal distance from top left corner of the screen. Set it to 0 if you're using this widget within Sidebar meta-widget. There is no need to put it inside Sidebar folder.
  left          :         "0"
```

The widget currently supports flex positioning, easy background blur and contains tons of probably very poorly written code.

##### This is a fork of Piotr Gajos' widget.  [See Pe8er's other widgets](https://github.com/Pe8er/Ubersicht-Widgets)

# License: MIT License

Copyright (c) 2016 Stevie Howard

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
