---
layout: post
title:  "RVM, Unicorn, and Nginx on Startup in Ubuntu"
date:   2016-01-20 21:00:00
categories: RVM Unicorn Ubuntu
---

I run a "webserver" in my house on an old netbook for reasons I'll get into
in another blog post. I am only serving a single static html file which can be
done much easier than Nginx and Unicorn, but that is no fun! This gave me an
opportunity to learn a little more about both.

The scenario I am working with is unicorn installed in RVM with Nginx sitting
in front of it. This all lives on Ubuntu 15.04. On a reboot, Nginx fires up
fine but unicorn does not. There was a little hassle with doing this because I
installed Unicorn in RVM and not globally. I had to start the process from
"within" RVM, or rather start unicorn from within a specific gemset.

Looking on the [RVM site](https://rvm.io/deployment/init-d) there is a way to
alias a gemset. This is not necessary but it gives two advantages. One, it can
make for less typing and easier remembering and. Two, a ruby version can get
updated on an gemset and the alias just needs to be re-pointed to the new
version. The init scripts can remain unchanged. Again, This is not necessary to
get this to work. It is just a cool feature I didn't know about it before
researching this topic, but it is user friendly.

From there it was using a
[Unicorn init script](https://raw.githubusercontent.com/rvm/rvm/master/contrib/unicorn_init.sh)
that I came across. As the script states I had to add a unicorn.conf file to
/etc/unicorn and the init script would take care of the rest. At this point
I was able to "sudo /etc/init.d/unicorn start|stop" to control the service.

The last thing that I needed to do was start the unicorn service on boot. To do
this you can execute ".udo update-rc.d defaults" where, in my case, was "unicorn".
This will attempt to start the service on boot. To get a more in-depth look at
what exactly update-rc.d does, take a look
[here](http://manpages.ubuntu.com/manpages/jaunty/man8/update-rc.d.8.html).
