Class {
	#name : #SBImage,
	#superclass : #SBComponent,
	#instVars : [
		'src',
		'aling'
	],
	#category : #Smallbook
}

{ #category : #accessing }
SBImage >> aling [
	^ aling
]

{ #category : #accessing }
SBImage >> aling: anObject [
	aling := anObject
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
	^'<img src"', self src,'" class="SBImage ',self aling,'"></img>'.
	
]
