Class {
	#name : #SBComponent,
	#superclass : #Object,
	#instVars : [
		'text'
	],
	#category : #Smallbook
}

{ #category : #'instance creation' }
SBComponent class >> new: aText [
	"Creates a generic component (text)"

	| component |
	component := self new.
	component text: aText.
	^ component.
]

{ #category : #accessing }
SBComponent >> style [
	"Returns the component style."
	self subclassResponsibility.
]

{ #category : #accessing }
SBComponent >> text [
	"Returns the component content (text)"
	^ text
]

{ #category : #accessing }
SBComponent >> text: anObject [
	"Sets the component content (text)"
	text := anObject
]
