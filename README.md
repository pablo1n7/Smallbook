# Smallbook

```smalltalk
server:=SBServer new: 8080.
slide := SBSlide new:'Titulo'.
slide addComponents: (SBParagrah new: 'Este es un parrafo grande').
slide addComponents: (SBCode new: 'a := 20.').
server addSlide: slide index: 1.
```

# Start Server listening to port 8080.
```smalltalk
server start. 
```
# Stop Server.
```smalltalk
server stop.
```
