Class {
	#name : #SBCode,
	#superclass : #SBComponent,
	#category : #Smallbook
}

{ #category : #accessing }
SBCode >> style [
	"comment stating purpose of message"
	^'<i class="SBCode">',self text,'</i>'.
]
