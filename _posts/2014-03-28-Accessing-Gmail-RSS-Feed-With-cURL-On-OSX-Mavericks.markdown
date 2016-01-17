---
layout: post
title:  "Accessing The Gmail RSS Feed With cURL On OSX Mavericks"
date:   2014-03-28 12:00:00
categories: OSX cURL
---

There was an office gag I wanted to do that requried a small script that would speak a phrase every time an email with a certain title came through. After researching the various parts of the problem it looked like I could accomplish this with a couple of simple parts. Gmail offers an RSS feed for any unread items and any unread items with a specific tag at [https://mail.google.com/mail/feed.atom](https://mail.google.com/mail/feed.atom). This seemed like it should be easy enough with a cURL request. Once I had the response from this I could kick off "say" with the phrase I wanted if data was present.

It turns out that on OSX Mavericks it isn't quite to so easy to make a cURL request to Gmail because of updats that were made to crypto libraries that cURL uses. I asked a friend using Mountain Lion to run the same cURL request and it ran without problems. cURL states on its website that you should be able to pass the -k (--insecure) flag to the request and it should work without a problem. I am not sure why this wasn't working but I believe somehow Google was doing something on their end that prevented the response I was expectring if the certificate wasn't validated. I don't know how they accomplished this but something was happening on their end. I ended up being able to piece together a solution and below are the steps I used to get this to work.

1. Download the cer file from https://mail.google.com.
    *   There were great examples on how to do this  in [this](http://stackoverflow.com/questions/7885785/using-openssl-to-get-the-certificate-from-a-server) stack overflow post.<script src="https://gist.github.com/gdovicak/9914198.js"></script>



2. Add the cer file to OSX system keychain.
 *  Opened keychain
 *  File > Import Items
 *  opened .cer file downloaded from step 1.
 *  set all options on imported certificate to full allow.


3. Reboot!
    *   This didn't work for me when I didn't reboot.
    *   When I did reboot my keychain was hosed up. I deleted it and rebooted again.



4. Gmail check should now work.

Here is the final script I created. Not much to look at but when it worked it got some good laughs at the office.

<script src="https://gist.github.com/gdovicak/9914257.js"></script>
