Class {
	#name : #SBParagrah,
	#superclass : #SBComponent,
	#category : #Smallbook
}

{ #category : #accessing }
SBParagrah >> text [
	"Returns the paragraph text value"
	^ text
]

{ #category : #accessing }
SBParagrah >> text: aText [
	"Sets the paragraph text value"
	text := aText
]


{ #category : #action }
SBParagrah >> style [
	"Returns the HTML code needed to add a paragraph (<p>) component to the slides"
	^'<p class="SBParagrah">',self text,'</p>'.
]
