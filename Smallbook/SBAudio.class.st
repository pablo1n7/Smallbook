Class {
	#name : #SBAudio,
	#superclass : #SBComponent,
	#instVars : [
		'src',
		'type'
	],
	#category : #'Smallbook-Core'
}

{ #category : #'instance creation' }
SBAudio class >> new: aSrc type: aType [
	"Creates an audio component with a src and a type (mimetype) parameter"

	| audio |
	audio := self new.
	audio src: aSrc.
	audio type: aType.
	^ audio.
]

{ #category : #accessing }
SBAudio >> src [
	"Returns the audio src value"
	^ src
]

{ #category : #accessing }
SBAudio >> src: anObject [
	"Sets the audio src value"
	src := anObject
]

{ #category : #accessing }
SBAudio >> type [
	"Returns the audio type (mimetype) value"
	^ type
]

{ #category : #accessing }
SBAudio >> type: anObject [
	"Sets the audio type (mimetype) value"
	type := anObject
]

{ #category : #action }
SBAudio >> style [
	"Returns the HTML code needed to add an audio element to the slides"
	^'<div class="SBAudio">
		<audio controls>
			<source src="', self src,'" type="', self type,'">
		</audio>
	</div>'.	
]
