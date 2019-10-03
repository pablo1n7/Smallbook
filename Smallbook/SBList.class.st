Class {
	#name : #SBList,
	#superclass : #SBComponent,
	#instVars : [
		'items'
	],
	#category : #'Smallbook-Core'
}

{ #category : #action }
SBList >> addItem: aSBComponent [
	"Add a new item to the list."
	self items add: aSBComponent.
]

{ #category : #initialization }
SBList >> initialize [ 
	self items: OrderedCollection new.
]

{ #category : #accessing }
SBList >> items [
	"Returns the list items"
	^ items
]

{ #category : #accessing }
SBList >> items: anObject [
	"Sets the items for the list"
	items := anObject
]

{ #category : #action }
SBList >> style [
	"Populates and return the HTML <ul> component"
	|htmlUl|
	htmlUl:='<ul class="SBList">',self text.
	(self items) do: [ :each |
		htmlUl := htmlUl, (self styleItem: each)].
	^(htmlUl,'</ul>').
]

{ #category : #action }
SBList >> styleItem: aSBComponent [
	"Returns the HTML code for the list items"
	^'<li class="SBItemList">',aSBComponent style,'</li>'.
]
