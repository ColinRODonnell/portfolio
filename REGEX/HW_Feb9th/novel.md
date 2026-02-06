# COLIN'S REGEX NOTEPAD 

First with this novel I started my REGEX like any other time. 

FIND 
```
&
```
REPLACE
```
&amp;
```
I didn't find any. I didn't find any < or >'s either.

Next, I got rid of the uneeded information like the matter before the main title and after the Priscilla! line.

I wanted to wrap everything in a paragraph. I choose to do the backwards tagging like I did last time.

FIND 
```
\n\n
```
REPLACE 
```
</paragraph>\0<paragraph>
```
This worked perfectly.

Now, I would wrap the titles 

FIND 
```
<paragraph>([IVXCML]{2}.+)</paragraph>
```
Paragraph finds the things enclosed in the paragraph tag, IVXCML{2} 
would find two of these capital letters together (roman numerals). finally .+ reads until the end of the sentence.

REPLACE
```
<title>\1</title>
```
This didn't take into account the I V and X by themselves but I could do that manually since it was only 3.

Now I will add the chapter tags.

FIND 
```
<title>
```
REPLACE
```
</chapter><chapter>\0
```
This was very easy, especially doing it before with the paragragh.

All I had to do left was do the quotes and readd the metadata.

FIND 
```
"(.+)"
```
REPLACE
```
<quotation>\1</quotation>
```
I think this grabbed everything. I looked the file over and it looked fine.




