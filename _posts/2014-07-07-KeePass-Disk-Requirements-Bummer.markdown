---
layout: post
title:  "KeePass Disk Requirements... Bummer"
date:   2014-07-07 22:10:00
categories: Journal KeePass
---

Ok, maybe not KeePass itself, but when you include everything else required to run it, disk requirements are a bummer:

I have been using [KeePass](http://keepass.info) for the past several weeks on my Ubuntu box. I decided that it was time for me to use some password maangement software. I liked it as a free alternative to LastPass or something similar. It is a bit cumbersome to set up and use consistently (as are, in my opinion, many things with gui's and Linux), but once it is going it works well. I did find it odd how it integrates with broswers which is by adding a small http server as a plugin to KeePass and allowing broswer extensions to access the password database via the webserver. Although it was a bit strange to me to do it this way, it worked.

I used it and liked it enough that I thought I would move it to my mac and start getting my wife up and running with it. As I started going through the [set up process](http://keepass.info/help/v2/setup.html#mono) I realized that I was going to be needing 450+ MB of disk space when installing Mono. For me and my small SSD, that is way to much overhead for what should be a small utility app. It didn't dawn on me how much disk is required to run KeePass when installing this on my Linux box probably because I used the package maanger and ignored it, but I should not have.

I was really excited when I thought I found a good free password manager, but as has happened many times in the past with free consumer software, I was let down. Hell, I have even developed consumer software that is no good so I understand many of these projects are spare time projects. If I was willing to live with the disk utilization or I had other uses for the Mono framework I would probably continue using KeePass but, for now, I am in search of a different password manager.
