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
	#category : #Smallbook
}

{ #category : #'instance creation' }
SBSlide class >> new: aText [
	"comment stating purpose of message"

	| slide |
	slide := self new.
	slide text: aText.
	slide styleCSS: self style.
	slide addComponents: (SBTitle new: slide text).
	^ slide
]

{ #category : #'instance creation' }
SBSlide class >> new: aText style: aStyle [
	"comment stating purpose of message"

	| slide |
	slide := self new: aText.
	slide styleCSS: aStyle.
	^ slide
]

{ #category : #accessing }
SBSlide class >> style [ 
	(style) ifNil: [^'default'].
	^style
]

{ #category : #accessing }
SBSlide class >> style: aStyle [
	style := aStyle
]

{ #category : #action }
SBSlide >> _style: aSize [
	"comment stating purpose of message"
	|string|
	string := self class javascript,'<body><link rel="stylesheet" href="/static-files/base.css"><link rel="stylesheet" href="/static-files/',self styleCSS ,'.css"><div class="Control" > <a class="Prev" href="/',((self prevIndex: aSize) asString),'"><<<a/> ',(self index asString),' / ',(aSize asString),' <a class="Next" href="/',((self nextIndex: aSize) asString),'">>><a/></div><div class="SBSlide">'.
	(self components) do: [ :each |
		string := string, (each style)].
	^ string,'</div></body>'

]

{ #category : #action }
SBSlide >> addComponents: aComponent [
	"comment stating purpose of message"
	self components add: aComponent.
]

{ #category : #accessing }
SBSlide >> components [
	^ components
]

{ #category : #accessing }
SBSlide >> components: anObject [
	components := anObject
]

{ #category : #accessing }
SBSlide >> index [
	^ index
]

{ #category : #accessing }
SBSlide >> index: anObject [
	index := anObject
]

{ #category : #initialization }
SBSlide >> initialize [
	"comment stating purpose of message"
	self components: OrderedCollection new. 
]

{ #category : #action }
SBSlide >> nextIndex: aSize [
	"comment stating purpose of message"

	| aIndexNext |
	aIndexNext := (self index + 1).
	(aIndexNext > aSize) ifTrue: [  ^'1']; ifFalse: [  ^aIndexNext asString].
]

{ #category : #action }
SBSlide >> prevIndex: aSize [
	"comment stating purpose of message"

	| aIndexPrev |
	aIndexPrev := (self index - 1).
	(aIndexPrev = 0) ifTrue: [  ^aSize asString]; ifFalse: [  ^aIndexPrev asString].
]

{ #category : #action }
SBSlide >> specialSlide [
	"comment stating purpose of message"
	(self components at:1) level:'SpecialTitle'.
]

{ #category : #action }
SBSlide >> style: aSize [
	"comment stating purpose of message"
	|string|
	string := 
	'<body>
	<link rel="stylesheet" href="/static-files/highlight.css">
	<script src="/static-files/highlight.js"></script>
	<script src="/static-files/base.js"></script>
	<link rel="stylesheet" href="/static-files/base.css">
	<link rel="stylesheet" href="/static-files/',self styleCSS ,'.css">
	<div class="Control" > 
	<a class="Prev" href="/',((self prevIndex: aSize) asString),'"><<<a/> ',(self index asString),' / ',(aSize asString),' 
	<a class="Next" href="/',((self nextIndex: aSize) asString),'">>><a/></div>
	<div class="SBSlide">'.
	(self components) do: [ :each |
		string := string, (each style)].
	
	^ string,'</div></body>'

]

{ #category : #accessing }
SBSlide >> styleCSS [
	^ styleCSS
]

{ #category : #accessing }
SBSlide >> styleCSS: anObject [
	styleCSS := anObject
]
