Class {
	#name : #SBLinkTest,
	#superclass : #TestCase,
	#category : #'Smallbook-Tests'
}

{ #category : #test }
SBLinkTest >> testHref [
	| aLink |
	
	aLink := SBLink new: 'unTexto' href: 'https://twitter.com/'.
	
	self assert: aLink href equals: 'https://twitter.com/'.
]
