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
SBImageTest >> testPercentSize [

	|image|
	image := SBImage new.
	image percentSize: 100.
	self assert: image percentSize equals: 100.
]

{ #category : #test }
SBImageTest >> testSrc [

	|image|
	image := SBImage new src: 'google.com/hola.png'.
	self assert: image src equals: 'google.com/hola.png'.
]

{ #category : #test }
SBImageTest >> testStyle [
	
	|image imageHTML|
	image := SBImage new: 'https://pharo.org/web/files/pharo.png' align: 'Center' percentSize:40.
	imageHTML := '<div class="SBImage ',image align,'"><img style="width:',image percentSize asString,'%" src="', image src,'" ></img></div>'.
	self assert: image style equals: imageHTML.
	
]
