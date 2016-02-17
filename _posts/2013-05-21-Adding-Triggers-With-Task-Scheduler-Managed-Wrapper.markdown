---
layout: post
title:  "Adding Triggers With Task Scheduler Managed Wrapper"
date:   2013-05-21 12:00:00
categories: windows scheduled-tasks 
---

I had a need to manage Windows scheduled tasks from the web so I went in search of a library to help and I came across [Task Scheduler Managed Wrapper](http://taskscheduler.codeplex.com/). It was very easy to use and worked as advertised. I would recommend this project if you find a need to work with scheduled tasks on Windows. I did run into one small issue when trying to add a new trigger to an existing task. 

Following the examples that are out there on the web did not work for my use case. I figured out to add a new trigger to an existing task I had to open the task and also set my account information on that task. I was not able to add a trigger without first setting my account information on that task. This is what I expected to work but it did not: 

```c#
var st = new ScheduledTasks(); 
var trigger = new DailyTrigger((short)hour, (short)minute); 
var t = st.OpenTask(taskName); 
t.Triggers.Add(trigger); 
t.Save(); 
t.Close(); 
st.Dispose();
```

Once I Added the line with SetAccountInformation everything worked: 

```c#
var st = new ScheduledTasks(); 
var trigger = new DailyTrigger((short)hour, (short)minute); 
var t = st.OpenTask(taskName); 
t.SetAccountInformation(_config.ScheduledTaskRunnerUsername, _config.ScheduledTaskRunnerPassword); 
t.Triggers.Add(trigger); 
t.Save(); 
t.Close(); 
st.Dispose();
```
