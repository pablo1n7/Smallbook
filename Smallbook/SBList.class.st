Class {
	#name : #SBList,
	#superclass : #SBComponent,
	#instVars : [
		'items'
	],
	#category : #Smallbook
}

{ #category : #action }
SBList >> addItem: aSBComponent [
	"comment stating purpose of message"
	self items add: aSBComponent.
]

{ #category : #initialization }
SBList >> initialize [ 
	self items: OrderedCollection new.
]

{ #category : #accessing }
SBList >> items [
	^ items
]

{ #category : #accessing }
SBList >> items: anObject [
	items := anObject
]

{ #category : #action }
SBList >> style [
	"comment stating purpose of message"
	|htmlUl|
	htmlUl:='<ul class="SBList">',self text.
	(self items) do: [ :each |
		htmlUl := htmlUl, (self styleItem: each)].
	^(htmlUl,'</ul>').
]

{ #category : #action }
SBList >> styleItem: aSBComponent [
	"comment stating purpose of message"
	^'<ul class="SBItemList">',aSBComponent style,'</ul>'.
]
