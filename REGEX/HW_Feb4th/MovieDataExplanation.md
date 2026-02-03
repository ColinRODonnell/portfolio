# 
### Colin's REGEX Notepad 

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



```
^.+
```
I set this to replace:
```
<movie>\0</movie>
```

Second step was a little trickier but I managed to do it

Find: 
```
(<movie>)(.+?)(\t)
```



This was put on replace
```
\1<title>\2</title>
```
Next, the years I wanted to try something else that was quicker.

Find:
```
\d{4}
```
Replace:
```
<year>\0</year>
```


This means that any 4 digit number would be wrapped with a year contraint.

For the location I just repeated step 2 basically. Then, for the last one, duration, I just filled the spots between the end of location to the end of the sentence.

Find: 
```
(</location>)(.*?)(</movie>)
```
Replace:
```
\1<duration>\2</duration>\3
```

 Finally, because the dot for all kept crashing my software I manually did it in the XML editor by doing
 ```
 crtl + a 
```
Then I used 
```
crtl + e
```
this allowed me to wrap the entire text in a matter of seconds. I looked at the status and it was green. That meant the file was ready to go.
