---
layout: post
title:  "Django nonrel and mongoDB on Heroku"
date:   2012-02-23 12:00:00
categories: heroku django 
---

I am working on a new web application that, for the time being, will be called Short Story. It uses python, Django nonrel, and sits on top of a Mongo Database. I didn't want to spend the time managing the infrastructure so I decided to host the application on [Heroku](http://www.heroku.com/) and use the hosted Mongo service [Mongo HQ](https://mongohq.com/home) since it is offered as an add on to Heroku. There is a good [how-to](http://devcenter.heroku.com/articles/django) on Heroku's site about how to get a normal Django app up and running if you are starting from scratch. I walked through the how-to with a brand new test application and everything worked without a hitch. I ran into a couple of issues when trying to get my existing application up there and I will discuss the problems and the solutions I came up with. ###Django Application Must be in a Package Subdirectory The first issue that I ran into was that my application would not deploy correctly because it was not recognized as a Django app. I was getting the error "Django app must be in a package subdirectory". This was happening because Heroku required a different directory structure that what I had in place. The directory structure that I tried to push to heroku was: 

{% highlight python%}
-shortstory -.git -.gitignore -requirements.txt -settings.py -urls.py -registration -short_story_web -my_app_urls.py 
{% endhighlight %}

I needed to push all application files down a directory leaving the git files where they were. The directory structure ended up looking like this: 

{% highlight python %}
-shortstory -.git -.gitignore -requirements.txt -shortstory -settings.py -urls.py -registration -short_story_web -my_app_urls.py
{% endhighlight %}

Once I restructured my files and ran the deploy commands, I was able to get through this problem and on to my next one. ###PIP Requirements File The only reason I had any issues with a PIP requirements file is because I had never used one before. To start, the requirements file goes at the root of the application in the same location as the .git folder. To get a list of components into the requirements file I ran "pip freeze > requirements.txt" and it put the following list into the requirements file: Django==1.3.1 django-mongodb-engine==0.4.0 djangotoolbox==0.9.2 pymongo==2.1.1 python-inject==2.0-beta virtualenv==1.6.4 virtualenvwrapper==2.10.1 This list is great, but not all of these package are in PyPI so when I deployed this the way I received an error that not all packages were found and installed. What I did was fork all the projects on github and setup the requirements to install from my forked packages. My requirements file ended up looking like this: git+https://github.com/gdovicak/django-nonrel.git git+https://github.com/gdovicak/mongodb-engine.git git+https://github.com/gdovicak/djangotoolbox.git git+https://github.com/gdovicak/python-inject.git pymongo==2.1.1 Since I am working off of my own forks I don't have to worry about the original project getting updated and breaking my application. ###MongoHQ Configuration A Heroku deploy of a Django application will automatically inject the connection string information into your app's settings.py file and it sets an environment variable to make sure you are using those injected settings. To get around this and to use the Mongo connection string I had to remove the Heroku config setting with "heroku config:remove DATABASE_URL". I had a heck of a time getting the connection string right for some reason. If you install the MongoHQ add on you will get a Heroku config setting of MONGOHQ_URL, so to view your connection string run "heroku config". My connection string looked something like: `mongodb://heroku:55555555555555555555555555@staff.mongohq.com:10000/app5555555` and this translated into my settings.py like: 

{% highlight python %}
DATABASES = { 'default': { 'ENGINE': 'django_mongodb_engine', 'NAME': 'app5555555', 'USER': 'my_user, 'PASSWORD': 'my_pass', 'HOST': 'mongodb://staff.mongohq.com/app5555555', 'PORT': 10000, }, } 
{% endhighlight %}

So far I have enjoyed my experience with Heroku and Django nonrel. It is easy to understand, easy to deploy, requires very little management which allows me to keep programming, and is overall fun to work with. We'll see how Heroku and I get along as time passes.
