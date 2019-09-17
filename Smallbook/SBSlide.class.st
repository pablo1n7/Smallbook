Class {
	#name : #SBSlide,
	#superclass : #SBComponent,
	#instVars : [
		'index',
		'components',
		'styleCSS'
	],
	#category : #Smallbook
}

{ #category : #'instance creation' }
SBSlide class >> new: aText [
	"comment stating purpose of message"

	| slide |
	slide := self new.
	slide text: aText.
	slide addComponents: (SBTitle new: slide text).
	^ slide
]

{ #category : #constants }
SBSlide class >> simpleStyle [
	"comment stating purpose of message"
	^'
	<style>
	.SpecialTitle{
		text-aling:center;
		font-size:3.5em;
	}
	
	.NormalTitle{
	
	}
	
	.SBSlide{
		font-size:3em;
		margin: 1em;
	}
	.SBTitle{
	}

	.SBParagrah {
 		padding: 2%;
	}
	
	.SBCode {
 		padding: 4%;
	}
	
	.Control{
		text-align:center;
		font-size:1.5em;
	}
	
	.Next{
		padding-left: 5%;
	}
	
	.Prev{
		padding-right: 5%;
	}
	
	a {
 		color: inherit; /* blue colors for links too */
  	 	text-decoration: inherit; /* no underline */
	}
	
	</style>
	'
]

{ #category : #constants }
SBSlide class >> simpleStyleInv [
	"comment stating purpose of message"
	^'
	<style>
	body{
		background-color: black;
		color: white;
	}
	
	.SpecialTitle{
		text-aling:center;
		font-size:3.5em;
	}
	
	.NormalTitle{
	
	}
	
	.SBSlide{
		font-size:3em;
		margin: 1em;
	}
	.SBTitle{
	}

	.SBParagrah {
 		padding: 2%;
	}
	
	.SBCode {
 		padding: 4%;
	}
	
	.Control{
		text-align:center;
		font-size:1.5em;
	}
	a {
 		color: inherit; /* blue colors for links too */
  	 	text-decoration: inherit; /* no underline */
	}
	
	.Next{
		padding-left: 5%;
	}
	
	.Prev{
		padding-right: 5%;
	}
	
	
	</style>
	'
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
	self styleCSS: self class simpleStyleInv. 
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
	string := '<body>',self styleCSS ,'<div class="Control" > <a class="Prev" href="/',((self prevIndex: aSize) asString),'"><<<a/> ',(self index asString),' / ',(aSize asString),' <a class="Next" href="/',((self nextIndex: aSize) asString),'">>><a/></div><div class="SBSlide">'.
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
