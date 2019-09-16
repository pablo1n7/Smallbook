"
A SBSlideTest is a test class for testing the behavior of SBSlide
"
Class {
	#name : #SBSlideTest,
	#superclass : #TestCase,
	#category : #'Smallbook-Tests'
}

{ #category : #test }
SBSlideTest >> testAddComponents [

	|slide component components|
	slide := SBSlide new.
	components := OrderedCollection new.
	component := SBComponent new:'title'.
	slide addComponents: component.
	components add: component.
	self assertCollection: slide components hasSameElements: components.
]

{ #category : #test }
SBSlideTest >> testComponents [

	|slide|
	slide := SBSlide new:'titlte'.
	slide components: #().
	self assert: slide components equals: #()
]

{ #category : #test }
SBSlideTest >> testInitialize [

	|slide|
	slide := SBSlide new:'titlte'.
	self assert: slide components size equals:1.
	self assert: (slide components at:1) text equals:'titlte'.
	self assert: ((slide components at:1) style) equals:'<h1 class="SBTitle">titlte</h1>'
]

{ #category : #test }
SBSlideTest >> testStyleCSS [


	|slide|
	slide :=SBSlide new.
	slide styleCSS: 'jupylab'.
	self assert: slide styleCSS equals: 'jupylab'
]
