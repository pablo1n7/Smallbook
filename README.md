# Smallbook

Pharo lib.

# Basic usage

```smalltalk
server := SBServer new: 8080 staticFolder: ('/MY/DIR/USER/STATIC/userStatic').
SBSlide style:'simple_light'.
```

## Special Slide in localhost:8080/1.
```smalltalk

slide:=(SBSlide new:'Smallbook') specialSlide.
slide addComponents: (SBParagrah new: 'Smallbook is a tool for creating presentations with basic slides and show them in a web browser. Programmed in Pharo for Pharo :) ').
server addSlide: slide.

```
![](https://raw.githubusercontent.com/pablo1n7/Smallbook/master/StaticFiles/slide_1.png)


## New Slide in localhost:8080/2.
```smalltalk
slide := SBSlide new:'Literals in Pharo Smalltalk' style:'simple_light'.
slide addComponents: (SBParagrah new: 'Examples').
slide addComponents: (SBCode new: '
|number string list|
"comments"
number := 20.
string := ''String''.
list := #(1 2 3 4 5).
list do: [ :each | Transcript show: each;cr. ]
').
server addSlide: slide.
```
![](https://raw.githubusercontent.com/pablo1n7/Smallbook/master/StaticFiles/slide_2.png)


## New Slide in localhost:8080/3.
```smalltalk
slide := SBSlide new:'Pharo'.
slide addComponents: (SBParagrah new:'Pharo is a pure object-oriented programming language and a powerful environment, focused on simplicity and immediate feedback (think IDE and OS rolled into one).').
slide addComponents: (SBImage new: 'https://pharo.org/web/files/pharo.png' align: 'Center' percentSize:40).
server addSlide: slide.
```
![](https://raw.githubusercontent.com/pablo1n7/Smallbook/master/StaticFiles/slide_3.png)


## New Slide in localhost:8080/3.
```smalltalk
slide := SBSlide new:'Pharo'.
slide addComponents: (SBImage new: 'https://pharo.org/web/files/pharo.png' align: 'Center' percentSize:40).
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

![](https://raw.githubusercontent.com/pablo1n7/Smallbook/master/StaticFiles/styles.png)
