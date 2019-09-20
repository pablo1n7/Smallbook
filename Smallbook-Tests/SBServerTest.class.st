"
A SBServerTest is a test class for testing the behavior of SBServer
"
Class {
	#name : #SBServerTest,
	#superclass : #TestCase,
	#category : #'Smallbook-Tests'
}

{ #category : #test }
SBServerTest >> testAddSlide [

	| server slide slides|
	server := SBServer new: 8080.
	slide := SBSlide new: 'title'.
	server addSlide: slide.
	slides := (OrderedCollection new).
	slides add: slide.
	self assertCollection: server slides hasSameElements:slides.
]

{ #category : #test }
SBServerTest >> testAddSlideIndex [

	| server slide slides|
	server := SBServer new: 8080.
	slide := SBSlide new: 'title'.
	server addSlide: slide.
	slides := (OrderedCollection new).
	slides add: slide.
	self assertCollection: server slides hasSameElements:slides.
]

{ #category : #test }
SBServerTest >> testDelegator [

	|sbserver zdelegator|
	zdelegator := ZnDispatcherDelegate new.
	sbserver := SBServer new: 8080.
	sbserver delegator:zdelegator.
	self assert: sbserver delegator equals: zdelegator
]

{ #category : #test }
SBServerTest >> testHost [

	| server |
	server := SBServer new: 8080.
	server host: 'localhost'.
	self assert: server host equals: 'localhost'.
]

{ #category : #test }
SBServerTest >> testInitialize [

	| server |
	server := SBServer new: 8080.
	self assert: server port equals: 8080.
	self assertCollection: server slides hasSameElements:#().
	self assert: server host equals: 'localhost'.
]

{ #category : #test }
SBServerTest >> testPort [

	| server |
	server := SBServer new: 8080.
	self assert: server port equals: 8080.
]

{ #category : #test }
SBServerTest >> testServer [

	| sbserver server|
	sbserver := SBServer new: 8080.
	server := ZnServer new.
	sbserver server: server.
	self assert: sbserver server equals: server.
]

{ #category : #test }
SBServerTest >> testSlides [

	| sbserver |
	sbserver := SBServer new: 8080.
	sbserver slides: #().
	self assertCollection: sbserver slides hasSameElements: #().
]

{ #category : #test }
SBServerTest >> testStart [

	| sbserver |
	sbserver := SBServer new: 8000.
	sbserver start.
	self assert: sbserver server isRunning.
	sbserver stop.
]

{ #category : #test }
SBServerTest >> testStaticFolder [

	| sbserver |
	sbserver := SBServer new: 8000.
	sbserver staticFolder: '/home/user'.
	self assert: sbserver staticFolder equals: '/home/user'.
]

{ #category : #test }
SBServerTest >> testStop [

	| sbserver |
	sbserver := SBServer new: 8000.
	sbserver start.
	sbserver stop.
	self assert: sbserver server isRunning  equals: false.
]
