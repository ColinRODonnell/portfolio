## Regex 2: Colin's Notepad
For assignment 2 of the REGEX HW this one looked actually alot easier than the previous one 
besides the attribute; however, that was shown to me in class.

I started with the obvious &, <, or >'s. 

FIND
```
&
```
REPLACE 
```
&amp;
```
Fortunately, there were none to find, but it is always good to check :3


Next, I did the easy parts. I wrapped THE SONNETS and by William Shakespeare. These are super
easy I just typed them in the search and replaced it with 
```
<title>\0<title> and <playwright>\0</playwirght>
```
Actually, nevermind, I realized I should do this last manually.

Then I removed all the unecessary spaces at the beginning of the sentence

FIND 
```
^  
```
REPLACE 
```
N/A
```
For 300+ I had to do it again because there was special indents 

I decided to do the lines first because I noticed the puntuation at the end of sentences and the double returns.

FIND
```
^(?![IVXLC]+$).+(?:[,;:.?']\n|)
```
carrot represents the start of a line, ?! means that a I, V, X, L, or C cannot follow and 
$ to the end of a sentence. Then I put my punctuations in (,;:.?') I had to redo it
because I didn't realize that the appostrophe exsisted at ends of sentences.
and a newline for basically the return key.  

REPLACE 
```
<line>\0</line>
```
All I had to do now is the sonnet attribute. 

FIND
```
<line>([IVXLCDM]+)</line>
```
REPLACE
```
</sonnet><sonnet n="\1">
```
You have no idea how long this took me to figure out but I felt so SMART when I figured it out.
Originally, I went down a rabbit hole of trying to go from roman numeral to 14 new lines
down because each sonnet has 14 lines. This took me about 3 hours, but I'm proud I did it on my own without pleading for help

The final steps were to clean up the end tags at the start and end and wrapped the entire thing in
```
<xml>
</xml>
```

