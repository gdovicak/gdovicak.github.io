---
layout: journal_page
title:  "Laravel Unit Tests setUp and tearDown Example"
date:   2014-08-04 22:00:00
categories: Journal Laravel Testing
---

If you are writing a unit test and using the Laravel PHP framework, (I know, who writes unit tests in PHP), and extending Laravel's "TestCase" I recommend the first thing that you do when writing a new test class is write the following setUp and tearDown methods. 

{% highlight ruby %}
class FakeTest extends TestCase{
    public function setUp(){
        parent::setUp();
    }
    public function tearDown(){
        parent::tearDown();
        Mockery::close();
    }
}
{% endhighlight %}

I haven't looked deeply into the source of what is happening in the parent setUp and tearDown methods but in tests that I am not doing this I have noticed very flaky behavior.

The other line not mentioned yet is the "Mockery::close()". This is another very important call to make if you are using Mockery. I believe this also was the cause of weird behavior that has made my tests fail in other parts of the code that I wasn't even working on. I believe what is happening here is the same type is being mocked across two different test cases and the property values are invalidating expecations. Even though I am not sure what is happening under the hood yet, I know adding the example code would have saved me some headache.

I hope this can save someone some time or a headache.
