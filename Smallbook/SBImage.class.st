Class {
	#name : #SBImage,
	#superclass : #SBComponent,
	#instVars : [
		'src',
		'align',
		'percentSize'
	],
	#category : #'Smallbook-Core'
}

{ #category : #'instance creation' }
SBImage class >> new: aSrc align: anAlign [
	"comment stating purpose of message"

	| image |
	image := self new.
	image src: aSrc.
	image align: anAlign.
	^ image.
]

{ #category : #'instance creation' }
SBImage class >> new: aSrc align: anAlign percentSize: anSize [
	"comment stating purpose of message"

	| image |
	image := self new.
	image src: aSrc.
	image align: anAlign.
	image percentSize: anSize.
	^ image.
]

{ #category : #accessing }
SBImage >> align [
	^ align
]

{ #category : #accessing }
SBImage >> align: anObject [
	align := anObject
]

{ #category : #accessing }
SBImage >> percentSize [
	^ percentSize
]

{ #category : #accessing }
SBImage >> percentSize: anObject [
	percentSize := anObject
]

{ #category : #accessing }
SBImage >> src [
	^ src
]

{ #category : #accessing }
SBImage >> src: anObject [
	src := anObject
]

{ #category : #action }
SBImage >> style [
	"comment stating purpose of message"
	^'<div class="SBImage ',self align,'"><img style="width:',self percentSize asString,'%" src="', self src,'" ></img></div>'.
	
]
