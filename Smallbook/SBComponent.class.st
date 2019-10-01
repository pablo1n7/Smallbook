Class {
	#name : #SBComponent,
	#superclass : #Object,
	#instVars : [
		'text'
	],
	#category : #'Smallbook-Core'
}

{ #category : #'instance creation' }
SBComponent class >> new: aText [
	"comment stating purpose of message"

	| component |
	component := self new.
	component text: aText.
	^ component.
]

{ #category : #accessing }
SBComponent >> style [
	"comment stating purpose of message"
	self subclassResponsibility.
]

{ #category : #accessing }
SBComponent >> text [
	^ text
]

{ #category : #accessing }
SBComponent >> text: anObject [
	text := anObject
]
