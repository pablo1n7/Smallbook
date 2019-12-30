Class {
	#name : #SBParagraph,
	#superclass : #SBComponent,
	#category : #'Smallbook-Core'
}

{ #category : #action }
SBParagraph >> style [
	"Returns the HTML code needed to add a paragraph (<p>) component to the slides"
	^'<p class="SBParagrah">',self text,'</p>'.
]

{ #category : #accessing }
SBParagraph >> text [
	"Returns the paragraph text value"
	^ text
]

{ #category : #accessing }
SBParagraph >> text: aText [
	"Sets the paragraph text value"
	text := aText
]
