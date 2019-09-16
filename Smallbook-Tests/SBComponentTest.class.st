"
A SBComponentTest is a test class for testing the behavior of SBComponent
"
Class {
	#name : #SBComponentTest,
	#superclass : #TestCase,
	#category : #'Smallbook-Tests'
}

{ #category : #test }
SBComponentTest >> testText [

	|component|
	component := SBComponent new:'title'.
	self assert: component text equals: 'title'
]
