---
layout: post
title:  "Accessing Sql Server From a Mac"
date:   2016-04-05 08:00:00
categories: SqlServer Mac
---

I was a Windows user and .Net developer for seven years before I ever touched a mac. It was two more years before I was able to make the jump to Mac at work. I loved it and between Linux Mint and Mac OSX I will never use Windows day to day again if I have my choice.                   

Visual Studio and Sql Server Management Studio have been difficult to replace though. With Microsoft's recent open source push these two apps aren't far from working everywhere, but today they don't. Below is my setup for replacing Sql Server Management Studio on the mac (and in theory, Linux).

In my previous job I was working with Oracle. When getting into that world everyone around me was on Windows and using Toad. Toad did not work well for me on a Mac. I needed and alternative and was pointed in the direction of Oracle's SQL Developer. I downloaded it, added my oracle connection stings, and I was off. It worked pretty well.                                                                                                         

When I started a new job I had some work to do in Sql Server. I thought I would have to install a Windows VM and Sql Server Management Studio. After some research I learned that with a little configuration Sql Server is accessible from SQL Developer. This was great for me because I was already familiar with the hot keys. If the correct driver is downloaded and SQL Developer is pointed to use that driver, it works pretty well.                                                                 

The [SQL Developer](http://www.oracle.com/technetwork/developer-tools/sql-developer/overview/index-097090.html) setup can be seen in [this video](http://www.oracle.com/technetwork/developer-tools/sql-developer/sql-server-connection-viewlet-swf-089886.html).  The video was great for showing how to add a new driver, but the video didn't help me find the driver that I needed. I stumbled onto [jTDS](http://jtds.sourceforge.net/) drivers. They can be downloaded from [here](https://sourceforge.net/projects/jtds/files/jtds/).                    

I downloaded the drivers, unzipped them, and put them in a place where I wouldn't delete them. If I came across them six months later and didn't remember what they were for I would delete them if I didn't name folders properly. I added the new driver as the video showed. At that point I was able to connect to sql server instances.

One big piece that is missing from this is the ability to access Sql Server Jobs. For now, I will need to keep around Management Studio if I need to do any work with Jobs. Most day to day data exploration and t-sql can be done within Oracle SQL Developer. 
