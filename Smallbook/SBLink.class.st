Class {
	#name : #SBLink,
	#superclass : #SBComponent,
	#instVars : [
		'href'
	],
	#category : #Smallbook
}

{ #category : #'as yet unclassified' }
SBLink class >> new: aText href: anHref [
	"Creates a link component with an href and a text"
	| aLink |
	
	aLink := self new.
	
	aLink href: anHref.
	aLink text: aText.
	
	^ aLink.
]

{ #category : #accessing }
SBLink >> href [
	"Returns the link's href"
	^ href
]

{ #category : #accessing }
SBLink >> href: anObject [
	"Sets the link's href"
	href := anObject
]

{ #category : #action }
SBLink >> style [
	"Returns the HTML code needed to add a link to the slides"
	^'<a class="SBLink" href="',self href,'">',self text,'</a>'.
]
