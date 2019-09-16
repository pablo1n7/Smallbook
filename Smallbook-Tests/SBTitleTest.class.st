"
A SBTitleTest is a test class for testing the behavior of SBTitle
"
Class {
	#name : #SBTitleTest,
	#superclass : #TestCase,
	#category : #'Smallbook-Tests'
}

{ #category : #test }
SBTitleTest >> testInitialize [

	|title|
	title := SBTitle new: 'title'.
	self assert: title level equals: 'h1'.
]

{ #category : #test }
SBTitleTest >> testLevel [

	|title|
	title := SBTitle new: 'title'.
	title level: 'h1'.
	self assert: title level equals: 'h1'
]
