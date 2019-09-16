Class {
	#name : #SBSlide,
	#superclass : #SBComponent,
	#instVars : [
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
	h1{
		text-aling:center;
		font-size:3.5em;
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

{ #category : #initialization }
SBSlide >> initialize [
	"comment stating purpose of message"
	self components: OrderedCollection new.
	self styleCSS: self class simpleStyle. 
]

{ #category : #action }
SBSlide >> specialSlide [
	"comment stating purpose of message"
	(self components at:1) level:'h1'.
]

{ #category : #action }
SBSlide >> style [
	"comment stating purpose of message"
	|string|
	string := '<body>',self styleCSS ,'<div class="SBSlide">'.
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
