# Colin's REGEX Notepad 

First, I looked for any &, <, or > that would make the XMl fail 

So I needed to find:

**Find:**

```
&
```
**Replace:**

and replace with the special escape characters for ampersands:
```
&amp;
```
Next, I tried to actually add xml tags to the movie name, date, location and duration

I used the following expression to find. 
I made sure that *dot matches all* was NOT set so that
the dot matches on any character but only inside each line. 
This expression matches on the beginning of each line, 
and *one ore more characters on that line*.

```
^.+
```
I set this to replace:
```
<movie>\0</movie>
```

Second step I matched this and set capturing groups so I could tag the titles:

Find: 
```
(<movie>)(.+?)(\t)
```



I set this to replace, so I could keep the first tag, and then add a new pair of tags for the title elements:
```
\1<title>\2</title>
```
At the very end of class, I manually set a root element around the entire document 
```
<xml>
   <movie>...</movie>
   <movie>....</movie>
    <!--yada yada yada more code -->   
</xml>
```

And I saved the file as movieData.xml.
And I closed it.
And I opened my new movieData.xml and saw that I had a green square in oXygen, indicating 
that the document is well-formed. Yay!

I can continue doing more regex find and replace operations to tag the dates, locations, and time durations inside each of these movie elements. 
