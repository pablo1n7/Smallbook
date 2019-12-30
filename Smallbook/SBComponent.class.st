"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	text:		<Object>


    Implementation Points
"
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
