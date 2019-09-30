Class {
	#name : #SBTitle,
	#superclass : #SBComponent,
	#instVars : [
		'level'
	],
	#category : #Smallbook
}

{ #category : #initialization }
SBTitle >> initialize [ 
	"Sets a default slide title level"
	self level:'NormalTitle'.
]

{ #category : #accessing }
SBTitle >> level [
	"Returns the slide title level."
	^ level
]

{ #category : #accessing }
SBTitle >> level: anObject [
	"Sets a level for the title of a slide."
	level := anObject
]

{ #category : #action }
SBTitle >> style [
	"Returns the HTML code needed to add a title to the slide"
	^ '<h1 class="SBTitle ',self level,'">',self text,'</h1>'
]
