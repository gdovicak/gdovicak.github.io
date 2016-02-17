---
layout: post
title:  "Stubbing an App Engine Request"
date:   2011-06-23 12:00:00
categories: Python TDD Appengine 
---

Over the past several months testing has become an obsession of mine. This has been driven by the adoption of an agile development process at work. The testing at work was in .Net and and I quickly saw the benefits that it provided. This practice then bled over into my development at home which is primarily done in python on Google App Engine.

I have been working on a small application that requires an AJAX call, or RPC as Google calls it. When doing a RPC Google recommends (it is an obvious recommendation for more seasoned python developers but it wasn't to me yet) to not allow an a call with an "_" in the first character position. Google offers this [this](http://code.google.com/appengine/articles/rpc.html) snippet of code to determine if the request is valid or not.


```python
class RPCHandler(webapp.RequestHandler): 
    def __init__(self): 
        webapp.RequestHandler.__init__(self) 
        self.methods = RPCMethods() 
    
    def get(self): 
        func = None 
        action = self.request.get('action') 
        
        if action: 
            if action[0] == '_': 
                self.error(403) # access denied 
                return 
            else: 
                func = getattr(self.methods, action, None) 
                if not func: 
                    self.error(404) # file not found 
                    return args = () 
                while True: 
                    key = 'arg%d' % len(args) 
                    val = self.request.get(key) 
                    if val: 
                        args += (simplejson.loads(val),) 
                    else: break 
                    
                    result = func(*args) 
                    
        self.response.out.write(simplejson.dumps(result)) 

class RPCMethods: 
    def Add(self, *args): 
        ints = [int(arg) for arg in args] return sum(ints)
```

I wanted to change this code a little bit to create classes that inherit from the RPCHandler class instead of having the RPCHandler call other classes. I needed to write a test against the RPCHandler class so that I refactor it without fear. My problem was the RPCHandler class inherited from the Request class and I did not know how to properly stub a request object.

I tried using a mocking framework to do this and did not have much success. It required a lot of extra testing code. It seemed that there was a better way to do it. I then found a [blog post](http://blog.perthulin.com/2010/10/google-app-engine-unit-testing.html) by[Per Thulin](http://blog.perthulin.com/) that showed the proper parameters required for stubbing a request object for a POST method. &nbsp;I followed the code examples and it worked great, tests passed against the post method. &nbsp;


```python
handler = MainHandler() 

handler.request = Request({ 'REQUEST_METHOD': 'POST', 
                            'PATH_INFO': '/', 
                            'wsgi.input': StringIO(form), 
                            'CONTENT_LENGTH': len(form), 
                            'SERVER_NAME': 'hi', 
                            'SERVER_PORT': '80', 
                            'wsgi.url_scheme': 'http', })

handler.response = Response() 
handler.post() 
```

I then tried to write a test for a GET request and it didn&rsquo;t work. &nbsp;I was missing an environ parameter being passed through to the request object. I figured the RPCHandler code was working properly because Google would not have posted it as example code, so my test must have been broken. I wasn&rsquo;t exactly sure what other parameter I needed so I decided to look into the([source code](http://code.google.com/p/googleappengine/source/browse/trunk/python/google/appengine/ext/webapp/__init__.py)) of the request class from the App Engine SDK. On line 124 I found the following code:


```python
query = property(lambda self: self.query_string) 
```

```python
h = RPCHandler("RPCMethods") 

h.request = webapp.Request({ 'REQUEST_METHOD': 'GET', 
                             'PATH_INFO': '/hello?action=add', 
                             'QUERY_STRING': 'action=add', 
                             'URL': 'http://localhost/hello?action=add', 
                             'wsgi.input': StringIO(form), 
                             'CONTENT_LENGTH': len(form), 
                             'SERVER_NAME': 'hi', 
                             'SERVER_PORT': '80', 
                             'wsgi.url_scheme': 'http'}) 

h.get() 
```
