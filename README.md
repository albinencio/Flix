# Project 1 - *Flix*

**Flix** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **3** hours spent in total

## User Stories

The following **required** user stories are complete:

- [x] User sees app icon in home screen and styled launch screen (+1pt)
- [x] User can scroll through a list of movies currently playing in theaters from The Movie DB API (+5pt)
- [x] User can "Pull to refresh" the movie list (+2pt)
- [x] User sees a loading state while waiting for the movies to load (+2pt)

The following **optional** user stories are implemented:

- [ ] User sees an alert when there's a networking error (+1pt)
- [ ] User can search for a movie (+3pt)
- [ ] While poster is being fetched, user see's a placeholder image (+1pt)
- [ ] User sees image transition for images coming from network, not when it is loaded from cache (+1pt)
- [ ] Customize the selection effect of the cell (+1pt)
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete (+2pt)

The following **additional** user stories are implemented:

- [ ] List anything else that you can get done to improve the app functionality! (+1-3pts)

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How to make the UI look more advanced and interesting.
2. How to add functionality to let the user watch the movie trailers from the app.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/albinencio/Flix/blob/master/Demos/FlixDemo.gif' title='Part 1' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

The biggest challenge was understanding where to make the function calls to activityIndicator.startAnimating() and stopAnimating(). My indicator would not show up initially as I was making the method calls inside viewDidLoad().

## License

    Copyright © 2018 Alberto Nencioni. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


# Project 2 - *Flix*

**Flix** is a movies app displaying box office and top rental DVDs using [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **4** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User can tap a cell to see a detail view (+5pts)
- [x] User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView (+5pts)

The following **stretch** features are implemented:

- [x] User can tap a poster in the collection view to see a detail screen of that movie (+3pts)
- [x] In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer (+3pts)
- [ ] Customize the navigation bar (+1pt)
- [ ] List in any optionals you didn't finish from last week (+1-3pts)
   - ...
   - ...

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How to modify how the YouTube webpage responds in the app (e.g. playing it on full screen automatically, going back to the previous view once the video ends, etc.)
2. How to make the titles' font size adjust automatically to make the entire text fit on the screen.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/albinencio/Flix/blob/master/Demos/FlixDemo2.gif' title='Part 2' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Understanding the Swift workflow and how it sequences its operations when running its programs. In particular, I was originally implementing my request to get the trailer urls inside DetailViewController, but that wouldn't work as my response would get back once my WebView had already loaded.

## License

    Copyright © 2018 Alberto Nencioni. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


# Lab 3 - *Flix*

**Flix** is a movies app displaying box office and top rental DVDs using [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **2** hours spent in total

## User Stories

The following **required** user stories are complete:

- The following screens use AutoLayout to adapt to various orientations and screen sizes
   - [x] Movie Feed View (+3pt)
   - [x] Detail View (+2pt)

The following **stretch** user stories are implemented:

- [x] Dynamic Height Cells (+1)
- [x] Collection View AutoLayout (+2)

The following **additional** user stories are implemented:

- [x] Trailer View AutoLayout (+1-3pts)
- [x] Launch Screen AutoLayout
- [x] Activity Indicator AutoLayout

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How to improve AutoLayout in Trailer View to adjust cell size to not have white spacing in between cells when running on different devices.
2. Fix some issues with AutoLayout on the Detail View: when overview is too long, release date and title are pushed up, and title disappears under backdrop image.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

**Vertical view:**
<img src='https://github.com/albinencio/Flix/blob/master/Demos/FlixDemo3a.gif' title='Lab 3 - vertical' width='' alt='Video Walkthrough' />

**Horizontal view:**
<img src='https://github.com/albinencio/Flix/blob/master/Demos/FlixDemo3b.gif' title='Lab 3 - horizontal' width='' alt='Video Walkthrough' />

GIFs created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

The biggest challenge was definitely understanding how to set all the different constraints to obtain the best design. It was hard especially in case of the Detail View and the Superhero (Collection) View. There are still some improvements to be made.

## License

    Copyright © 2018 Alberto Nencioni. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


# Lab 5 - *Flix*

**Flix** is a movies app displaying box office and top rental DVDs using [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **2** hours spent in total

## User Stories

The following **required** user stories are complete:

- [x] Create a movie model (+2pt)
- [x] Implement the movie model (+2pt)
- [x] Implement property observers (+2pt)
- [x] Create a basic API Client (+2pt)

The following **additional** user stories are implemented:

- [ ] List anything else that you can get done to improve the app functionality! (+1-3pts)

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1.
2.

## Notes

This project itself wasn't as challenging as the writeup was very detailed as of what changes we should have made. What we learnt was very helpful because it gave me a better understanding of how models work, and it gave me an additional tool to build more meaningful and organized projects.

## License

    Copyright © 2018 Alberto Nencioni. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
