---
layout: journal_page
title:  "Google Analytics API - The Measurement Protocol"
date:   2014-07-16 22:00:00
categories: Journal Google-Analytics API
---

For a long time I have had several different needs to do data collection from the server to Google Analytics. There has always been ways to log to GA by sending a GET request that was modeled after the requests generated via the GA javascript. There have also been libraries that would help model requests properly for programmers. I believe this may have been a violation of the GA terms of service, but I cannot find a copy of the TOS that was prior to Universal Analytics so I don't know for sure. As there have always been workarounds it has never been as easy as it should have been and it was not a complete API. There is finally a Google Analytics Collection API in the [The Measurement Protocol](https://developers.google.com/analytics/devguides/collection/protocol/v1/) and it is awesome!

<br />
###Measuremnt Protocol Advantages
Even though I could log data to GA from the server using the old unsupported methods, there are some definitie advantages of using the Measurement Prototcol. I was never able to log referrer or IP addresses for doing geo-location lookups. There were also issues with maintaining users and sessions with the old methods. With the new Measurement Protocol this is no longer an issue as Google exposes all fields that are available in the javascript in the API and all reports populate as one would expect them to when logging data.

<br />
###Personal Use Case
The biggest use I have had for a GA API is for logging data as a 3rd party service provider. As a 3rd party I try to put the least amount of strain onto the host site as possible and loading in another javascript in the Google Analytics script and making more calls from the host site to log information to GA is not an ideal thing to do. It is also possible to overwrite or mess up the host sites tracking if they use Google Analytics already and it is implemented incorrectly as a 3rd party.

An example of this is when I was working on [WODBOX](http://www.wodboxapp.com) we allowed gym owners to use our platform to enter and manage their workout schedules. The gym would then put our javascript onto their site and we would publish and format their workouts at the appropriate times and place the workouts onto their site. As I stated previously, I do not want to add any more overhead than I need to for workouts to show up so the ability for me to log data sever side allows me to keep the number of requests to a minimum. Previously we accomplished this by logging data to our own databases which is not an ideal situation because we lose all the valuable information and canned reports that GA gives us and it can also lead to a lot of data to handle.

Overall I am very happy so far with the Measurement Protocol and look forward to finding more uses for it.
