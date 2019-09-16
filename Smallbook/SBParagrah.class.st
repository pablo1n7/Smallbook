Class {
	#name : #SBParagrah,
	#superclass : #SBComponent,
	#category : #Smallbook
}

{ #category : #accessing }
SBParagrah >> style [
	"comment stating purpose of message"
	^'<p class="SBParagrah">',self text,'</p>'.
]
