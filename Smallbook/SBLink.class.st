Class {
	#name : #SBLink,
	#superclass : #SBComponent,
	#instVars : [
		'href'
	],
	#category : #'Smallbook-Core'
}

{ #category : #'as yet unclassified' }
SBLink class >> new: aText href: anHref [
	" Create an <a> element with an href and a text"
	| aLink |
	
	aLink := self new.
	
	aLink href: anHref.
	aLink text: aText.
	
	^ aLink.
]

{ #category : #accessing }
SBLink >> href [
	^ href
]

{ #category : #accessing }
SBLink >> href: anObject [
	href := anObject
]

{ #category : #action }
SBLink >> style [
	"Return styling of link"
	^'<a class="SBLink" href="',self href,'">',self text,'</a>'.
]
