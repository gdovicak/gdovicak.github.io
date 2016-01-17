---
layout: post
title:  "Ubuntu 11.10 and the RT2500 rev01 Wireless Card"
date:   2012-02-23 12:00:00
categories: Wireless Ubuntu 
---

I wanted to share a bit of knowledge I have gained on trying to get a Belkin wireless card with the RT2500 chipset to work under Ubuntu 10.10 and 11.10. Basically, I can't get it to work. The card is recognized fine and initially the speeds are as expected. In less than a minute the card's transfer rate drops to approximately 1.5Mb/s and stays this way until the network adapter is restarted. I have checked the settings of the card using iwconfig and everything appears in order both before and after the speed drop. I did not do many things to attempt to fix this issue in Ubuntu 10.10 because I was going to upgrade soon and wanted to see if it would work better in the new version. I do know that the behavior described above is what happens out of the box. After upgrading to 11.10 I got the same results. It was time to start looking for a fix. 

I came across several [posts](http://ubuntuforums.org/showthread.php?t=853942) saying they were able to change the speed using iwconfig from 54Mb/s to 11Mb/s or 36Mb/s and the card would "work" after that. Even though I don't find this fix optimal after the time I spent on getting this to work I would have accepted it as a solution. It didn't make a difference if I found it optimal or not, it did not work. I decided at this point it was not going to work and was not worth the effort to get it working anymore. I swapped the card out with another I had in a Windows 7 box but the RT2500 wouldn't run under Windows 7 either. I do know that the card works under Windows XP so I don't think that it is a hardware issue. I just bought a new wireless stick and all was well. 

Hope someone can find this useful before wasting too much time trying to get it to work. I for some reason you do get it to work please leave a comment and let me know what worked for you.
