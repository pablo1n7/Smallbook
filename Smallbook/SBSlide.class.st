Class {
	#name : #SBSlide,
	#superclass : #SBComponent,
	#instVars : [
		'components'
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
]

{ #category : #accessing }
SBSlide >> style [
	"comment stating purpose of message"
	|string|
	string := '<div class="SBSlide">'.
	(self components) do: [ :each |
		string := string, (each style)].
	^ string,'</div>'

]
