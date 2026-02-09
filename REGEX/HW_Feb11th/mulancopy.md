# MULAN REGEX

We are now analyzing Mulan by Disney.

First, I started with the usual, find any <, > or &

FIND 
```
&
```
REPLACE
```
&amp;
```
I did not find any so onto the next step. This was very easy I just
found the double newline to insert my tags 

FIND 
```
\n\n
```
REPLACE 
```
</sp>\0<sp>
```
Finally I wrapped the entire text with dot matches all.

I was now done with the first part of this assignment. 

The goal is to wrap every block. 
