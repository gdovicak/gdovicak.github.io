---
layout: journal_page
title:  "Versioning Jenkins Configs and Vim pastetoggle"
date:   2014-06-27 17:41:00
categories: Journal Jenkins Vim
---

###Jenkins

I came across a [jenkins plugin] (https://wiki.jenkins-ci.org/display/JENKINS/SCM+Sync+configuration+plugin) that will commit jenkins configs to git when a change is made. I am installing this and configuring it for a few projects to see how well it works. In theory this is an ideal situation. Hopefully it executes as well as I expect it to.

###Vim
I have been reading [Practical Vim] (http://pragprog.com/book/dnvim/practical-vim) and it has taught me a tremendous amount about the text editor. I used Vim for more than two years before I picked up this book and it seemed to have most, if not all, of the answers to questions I had on the "right" way to do things within the editor.

Anyhow, I find myself executing ":set paste", pasting text into the editor, and then calling ":set nopaste" many times a day. While reading the book today there was a tip to try mapping "pastetoggle" to the f5 key. This would allow to turn on and off pasting in normal or insert modes. This removes another annoyance I had and makes my text entry just a little bit easier. 

This can be set when vim is launched at the command prompt or the following line can be added to a users .vimrc ":set pastetoggle=\<f5\>".

