# Smallbook

Pharo lib.

```smalltalk
server := SBServer new: 8080.
```

# Principal Slide in localhost:8080/.
```smalltalk
slide := (SBSlide new:'Introducción a Pharo') specialSlide.
slide addComponents: (SBParagrah new: 'Author1, Author2').
server addPrincipalSlide: slide.

```

# New Slide in localhost:8080/1.
```smalltalk
slide := SBSlide new:'Asignación en Pharo'.
slide addComponents: (SBParagrah new: '¿Como hacemos una asignación?').
slide addComponents: (SBCode new: 'number := 20.').
slide addComponents: (SBCode new: 'listInteger := #(1 2 3 4 5).').
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
