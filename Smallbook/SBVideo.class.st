Class {
	#name : #SBVideo,
	#superclass : #SBComponent,
	#instVars : [
		'height',
		'width',
		'src',
		'type'
	],
	#category : #'Smallbook-Core'
}

{ #category : #'instance creation' }
SBVideo class >> new: aSrc type: aType [
	"Creates a video component with a src and a type (mimetype) parameter"

	| video |
	video := self new.
	video src: aSrc.
	video type: aType.
	video height: 600.
	video width: 800.
	^ video.
]

{ #category : #'instance creation' }
SBVideo class >> new: aSrc type: aType height: aHeight width: aWidth [
	"Creates an video component with a src, a type (mimetype), a height and a width"

	| video |
	video := self new.
	video src: aSrc.
	video type: aType.
	video height: aHeight.
	video width: aWidth.
	^ video.
]

{ #category : #accessing }
SBVideo >> height [
	"Returns the video height value"
	^ height
]

{ #category : #accessing }
SBVideo >> height: aNumber [
	"Sets the video height value"
	height := aNumber
]

{ #category : #accessing }
SBVideo >> width [
	"Returns the video width value"
	^ width
]

{ #category : #accessing }
SBVideo >> width: aNumber [
	"Sets the video width value"
	width := aNumber
]

{ #category : #accessing }
SBVideo >> src [
	"Returns the video src value"
	^ src
]

{ #category : #accessing }
SBVideo >> src: anObject [
	"Sets the video src value"
	src := anObject
]

{ #category : #accessing }
SBVideo >> type [
	"Returns the video type (mimetype) value"
	^ type
]

{ #category : #accessing }
SBVideo >> type: anObject [
	"Sets the video type (mimetype) value"
	type := anObject
]

{ #category : #action }
SBVideo >> style [
	"Returns the HTML code needed to add a video element to the slides"
	^'<div class="SBVideo">
		<video width="',self width asString,'%" height="',self height asString,'%" controls>
			<source src="', self src,'" type="', self type,'">
		</video>
	</div>'.	
]
