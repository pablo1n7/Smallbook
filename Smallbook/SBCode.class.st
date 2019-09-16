Class {
	#name : #SBCode,
	#superclass : #SBComponent,
	#category : #Smallbook
}

{ #category : #action }
SBCode >> style [
	"comment stating purpose of message"
	^'<p><i class="SBCode">',self text,'</i></p>'.
]
