Class {
	#name : #SBTitle,
	#superclass : #SBComponent,
	#instVars : [
		'level'
	],
	#category : #Smallbook
}

{ #category : #initialization }
SBTitle >> initialize [ 
	"comment stating purpose of message"

	self level:'h2'.
]

{ #category : #accessing }
SBTitle >> level [
	^ level
]

{ #category : #accessing }
SBTitle >> level: anObject [
	level := anObject
]

{ #category : #action }
SBTitle >> style [
	"comment stating purpose of message"

	^ '<',self level,' class="SBTitle">',self text,'</',self level,'>'
]
