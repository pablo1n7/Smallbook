"
A SBImageTest is a test class for testing the behavior of SBImage
"
Class {
	#name : #SBImageTest,
	#superclass : #TestCase,
	#category : #'Smallbook-Tests'
}

{ #category : #test }
SBImageTest >> testAlign [

	|image|
	image := SBImage new align: 'Left'.
	self assert: image align equals: 'Left'.
]

{ #category : #test }
SBImageTest >> testAling [

	|image|
	image := SBImage new align: 'Left'.
	self assert: image align equals: 'Left'.
]

{ #category : #test }
SBImageTest >> testSrc [

	|image|
	image := SBImage new src: 'google.com/hola.png'.
	self assert: image src equals: 'google.com/hola.png'.
]
