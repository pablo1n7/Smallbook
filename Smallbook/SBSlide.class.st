Class {
	#name : #SBSlide,
	#superclass : #SBComponent,
	#instVars : [
		'index',
		'components',
		'styleCSS'
	],
	#classVars : [
		'style'
	],
	#category : #'Smallbook-Core'
}

{ #category : #'instance creation' }
SBSlide class >> new: aText [
	"Creates a new slide with text." 

	| slide |
	slide := self new.
	slide text: aText.
	slide styleCSS: self style.
	slide addComponent: (SBTitle new: slide text).
	^ slide
]

{ #category : #'instance creation' }
SBSlide class >> new: aText style: aStyle [
	"Creates a new slide with text and style." 

	| slide |
	slide := self new: aText.
	slide styleCSS: aStyle.
	^ slide
]

{ #category : #accessing }
SBSlide class >> style [
	"Returns the slide style or the default style if not defined." 
	(style) ifNil: [^'default'].
	^style
]

{ #category : #accessing }
SBSlide class >> style: aStyle [
	"Sets a slide style."
	style := aStyle
]

{ #category : #action }
SBSlide >> addComponent: aComponent [
	"Adds a component to a slide."
	self components add: aComponent.
]

{ #category : #accessing }
SBSlide >> components [
	"Returns the slide components"
	^ components
]

{ #category : #accessing }
SBSlide >> components: anObject [
	"Sets the slide components"
	components := anObject
]

{ #category : #accessing }
SBSlide >> controlHTML: aSize [
	"Returns the HTML code for the navigation controls."
	^'<div class="Control" > 
	<a class="Prev" href="/',((self prevIndex: aSize) asString),'.html">
	<<<a/>',(self index asString),' / ',(aSize asString),' 
	<a class="Next" href="/',((self nextIndex: aSize) asString),'.html">>>
	<a/></div>'
]

{ #category : #accessing }
SBSlide >> headHTML [
	"Returns the <head> HTML code for slides."
	^'<head>
	<meta name="viewport" content= "width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/static-files/highlight.css">
	<script src="/static-files/highlight.js"></script>
	<script src="/static-files/base.js"></script>
	<link rel="stylesheet" href="/static-files/base.css">
	<link rel="stylesheet" href="/static-files/',self styleCSS,'.css">
	</head>'
]

{ #category : #accessing }
SBSlide >> index [
	"Returns the index of the current slide"
	^ index
]

{ #category : #accessing }
SBSlide >> index: anObject [
	"Sets the index of the current slide"
	index := anObject
]

{ #category : #initialization }
SBSlide >> initialize [
	"Creates an empty collection to store the slides."
	self components: OrderedCollection new. 
]

{ #category : #action }
SBSlide >> nextIndex: aSize [
	"Returns the index of the next slide"
	| aIndexNext |
	aIndexNext := (self index + 1).
	(aIndexNext > aSize) ifTrue: [  ^'1']; ifFalse: [  ^aIndexNext asString].
]

{ #category : #action }
SBSlide >> prevIndex: aSize [
	"Returns the index of the previous slide"
	| aIndexPrev |
	aIndexPrev := (self index - 1).
	(aIndexPrev = 0) ifTrue: [  ^aSize asString]; ifFalse: [  ^aIndexPrev asString].
]

{ #category : #accessing }
SBSlide >> saveHTML: aSize in: aPath [ 
	"Writes the HTML code into *.html files."
	|aStream styleHTML|	
	aStream:=File 	openForWriteFileNamed:aPath,'/',self index asString,'.html'.
	styleHTML:=(self style:aSize) copyReplaceAll: '="/' with:'="./'.
	aStream nextPutAll: styleHTML.
	aStream close.
]

{ #category : #action }
SBSlide >> specialSlide [
	"Creates a new special slide (usually the first one in the presentation)"
	(self components at:1) level:'SBTitleSpecial'.
]

{ #category : #action }
SBSlide >> style [
	"Returns the HTML code needed to add slides"
	|string|
	string:='<div style="font-size: 0.6em;" class="SBSlide">'.
	(self components) do: [ :each |
		string := string, (each style)].
	
	^ string,'</div>'

]

{ #category : #action }
SBSlide >> style: aSize [
	"Returns the HTML code needed to add slides"
	|string controlHTML|
	controlHTML:=''.
	(aSize ~= 1) ifTrue:[controlHTML:=(self controlHTML: aSize)].
	string := self headHTML,'<body>',controlHTML,
	'<div class="SBSlide">'.
	(self components) do: [ :each |
		string := string, (each style)].
	
	^ string,'</div></body>'

]

{ #category : #accessing }
SBSlide >> styleCSS [
	"Returns the slide CSS style"
	^ styleCSS
]

{ #category : #accessing }
SBSlide >> styleCSS: anObject [
	"Sets the slide CSS style"
	styleCSS := anObject
]
