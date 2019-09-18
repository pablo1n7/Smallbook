# Smallbook

Pharo lib.

# Basic usage

```smalltalk
server := SBServer new: 8080.
SBSlide style:'simple_light'.
```

## Principal Slide in localhost:8080/1.
```smalltalk
slide := (SBSlide new:'Smallbook') specialSlide.
slide addComponents: (SBParagrah new: '<a href="www.github.com/pablo1n7/Smallbook"> www.github.com/pablo1n7/Smallbook </a>').
server addSlide: slide.

```

## New Slide in localhost:8080/2.
```smalltalk
slide := SBSlide new:'Literals in Pharo Smalltalk' style:'simple_light'.
slide addComponents: (SBParagrah new: 'Examples').
slide addComponents: (SBCode new: '
|number string list|
number := 20.
string := ''String''.
list := #(1 2 3 4 5).
').
server addSlide: slide.
```

## Start Server listening to port 8080.
```smalltalk
server start. 
```
## Stop Server.
```smalltalk
server stop.
```

# Styles
