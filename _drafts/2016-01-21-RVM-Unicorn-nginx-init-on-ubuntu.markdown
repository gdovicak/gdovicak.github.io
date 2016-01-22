---
layout: post
title:  "RVM, Unicorn, and Nginx on Startup in Ubuntu"
date:   2016-01-20 12:15:00
categories: RVM Unicorn Ubuntu
---

I run a "webserver" in my house on an old netbook for things I'll get into in another blog post. I am only serving a single static html file which I could do in a much easier manner than nginx and unicorn, but what fun woudld that have been! This gave me an opportunity to learn a little more about both.

The scenario I am working with is unicorn installed in RVM with nginx sitting in front of it. This all lives on Ubuntu 15.04. On a reboot, nginx fires up fine but unicorn does not. There was a little hassle with doing this because unicorn was installed in rvm and not globally, so I had to start the process from "within" rvm, or rather start unicorn from within a specific gemset.

Looking on the [rvm site] (https://rvm.io/deployment/init-d) there is a way to alias a gemset and then use the alias to kick off a process (unicorn in my case) from that alias. It seems like it just gives a friendly place to fire up unicorn from.

From there it was using a unicorn init script that I came across and adding int he correct paths from the alias that I created in rvm. 

[init script] (https://raw.githubusercontent.com/rvm/rvm/master/contrib/unicorn_init.sh)



