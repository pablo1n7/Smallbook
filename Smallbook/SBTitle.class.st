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

	self level:'NormalTitle'.
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

	^ '<h1 class="SBTitle ',self level,'">',self text,'</h1>'
]
