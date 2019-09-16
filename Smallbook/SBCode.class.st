Class {
	#name : #SBCode,
	#superclass : #SBComponent,
	#category : #Smallbook
}

{ #category : #accessing }
SBCode >> style [
	"comment stating purpose of message"
	^'<i>',self text,'</i>'.
]
