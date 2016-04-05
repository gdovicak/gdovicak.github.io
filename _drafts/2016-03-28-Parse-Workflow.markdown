---
layout: post
title:  "My Parse Workflow"
date:   2016-03-28 21:00:00
categories: Parse
---


For unit testing
tmux 3 sessions

Session 1 (Editor)
-Vim with the cloud code and tests

Session 2 (Parse develop)
-cd into cloudcode directory
-run parse develop

Session 3 (Mocha)
-cd into root of app
-run mocha --watch

For integration verification
-Same sessions except I ctrl+z my vim window and run make-<endpoint> to test my cloud functions.
