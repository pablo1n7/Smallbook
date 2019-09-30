Class {
	#name : #SBImage,
	#superclass : #SBComponent,
	#instVars : [
		'src',
		'align',
		'percentSize'
	],
	#category : #Smallbook
}

{ #category : #'instance creation' }
SBImage class >> new: aSrc align: anAlign [
	"Creates an image component with a src and an align parameter"

	| image |
	image := self new.
	image src: aSrc.
	image align: anAlign.
	^ image.
]

{ #category : #'instance creation' }
SBImage class >> new: aSrc align: anAlign percentSize: anSize [
	"Creates an image component with a src, an align, and a percentSize"

	| image |
	image := self new.
	image src: aSrc.
	image align: anAlign.
	image percentSize: anSize.
	^ image.
]

{ #category : #accessing }
SBImage >> align [
	"Returns the image align value"
	^ align
]

{ #category : #accessing }
SBImage >> align: anObject [
	"Sets the image align value"
	align := anObject
]

{ #category : #accessing }
SBImage >> percentSize [
	"Returns the image percentSize value"
	^ percentSize
]

{ #category : #accessing }
SBImage >> percentSize: anObject [
	"Sets the image percentSize value"
	percentSize := anObject
]

{ #category : #accessing }
SBImage >> src [
	"Returns the image src value"
	^ src
]

{ #category : #accessing }
SBImage >> src: anObject [
	"Sets the image src value"
	src := anObject
]

{ #category : #action }
SBImage >> style [
	"Returns the HTML code needed to add an image to the slides"
	^'<div class="SBImage ',self align,'"><img style="width:',self percentSize asString,'%" src="', self src,'" ></img></div>'.
	
]
