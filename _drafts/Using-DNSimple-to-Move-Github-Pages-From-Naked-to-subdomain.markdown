---
layout: post_page
title:  "Using DNSimple to Move Github Pages from a Naked Domain to a Subdomain"
categories: Journal DNSimple Github-Pages
---


For some reason that I don't remember I configured this site to serve from gdovicak.com instead of www.gdovicak.com. When I started writing my (almost) daily journal I decided I wanted the content to be served from www. There is no technical reason for this, I just preferred the www over the naked.


1. I updated CNAME file in the root of the jekyll to point to www.gdovicak.com. This file is required by Github Pages as stated [here](https://help.github.com/articles/adding-a-cname-file-to-your-repository).

2. I logged into [DNSimple](http://www.dnsimple.com) (my favorite DNS management app) and deleted the domain redirect record I previously had in there to redirect all requests to www.gdovicak.com to gdovicak.com. The [domain redirect](http://support.dnsimple.com/articles/redirect/) feature of [DNSimple](http://www.dnsimple.com) is one of my favorite features of the service. It has saved me on numerous occasions. This specific occassion if only one of several.

3. I deleted the A record I had previously created that pointed to github. I set this up a while ago as an A record. If you use the DNSimple "Service" feature to add Github Pages DNS to your domain it will now use an ALIAS record and point to the naked domain. ADD IMAGE OF ALIAS RECORD 

4. 





1) Update CNAME file -> inlcude link to instruction. I would do this first because this step seemed to take the longest to propogate.
2) Log in to dnsimple admin panel add cname ( I had to remove the redirect from www -> naked)
3) Remove A record.
4) Add redirect from naked to www.
5) Party!
