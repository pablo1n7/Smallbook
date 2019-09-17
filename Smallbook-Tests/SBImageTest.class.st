"
A SBImageTest is a test class for testing the behavior of SBImage
"
Class {
	#name : #SBImageTest,
	#superclass : #TestCase,
	#category : #'Smallbook-Tests'
}

{ #category : #test }
SBImageTest >> testAling [

	|image|
	image := SBImage new aling: 'Left'.
	self assert: image aling equals: 'Left'.
]

{ #category : #test }
SBImageTest >> testSrc [

	|image|
	image := SBImage new src: 'google.com/hola.png'.
	self assert: image src equals: 'google.com/hola.png'.
]
