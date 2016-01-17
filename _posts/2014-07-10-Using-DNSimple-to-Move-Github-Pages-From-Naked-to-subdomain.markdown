---
layout: post
title:  "Using DNSimple to Move Github Pages from a Naked Domain to a Subdomain"
date:   2014-07-10 22:00:00
categories: Journal DNSimple Github-Pages
---


For some reason that I don't quite remember I configured this site to serve from gdovicak.com instead of www.gdovicak.com. When I started writing my (almost) daily journal I decided I wanted the content to be served from www. There is no technical reason for this, I just preferred the www over the naked.

<br />
###Steps to Migrate
1. I updated CNAME file in the root of the jekyll to point to www.gdovicak.com. This file is required by Github Pages as stated [here](https://help.github.com/articles/adding-a-cname-file-to-your-repository).

2. I logged into [DNSimple](http://www.dnsimple.com) (my favorite DNS management app) and deleted the domain redirect record I previously had in there to redirect all requests to www.gdovicak.com to gdovicak.com. The [domain redirect](http://support.dnsimple.com/articles/redirect/) feature of [DNSimple](http://www.dnsimple.com) is one of my favorite features of the service. It has saved me on numerous occasions. This specific occassion if only one of several.

3. I deleted the A record I had previously created that pointed to github. I set this up a while ago as an A record. If you use the DNSimple "Service" feature to add Github Pages DNS to your domain it will now use an ALIAS record and point to the naked domain. ADD IMAGE OF ALIAS RECORD 

4.I then added a redirect record for the naked domain to point to the www domain so all of my links were not broken.

<br />
###Final Settings
<img src="/assets/images/gdovicak_dnsimple.png" />

<br />
This process isn't very difficult but hopefully someone can get a bit of information out of this post to help them solve a problem.
