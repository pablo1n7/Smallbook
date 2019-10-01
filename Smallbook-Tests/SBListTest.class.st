"
A SBListTest is a test class for testing the behavior of SBList
"
Class {
	#name : #SBListTest,
	#superclass : #TestCase,
	#category : #'Smallbook-Tests'
}

{ #category : #test }
SBListTest >> testAddItem [

	|list link collection|
	collection := OrderedCollection new.
	link:= SBLink new: 'text' href:'http://page'. 
	list:= SBList new:'text'.
	list addItem: link.
	collection add: link.
	self assertCollection: list items hasSameElements: collection.
]

{ #category : #test }
SBListTest >> testInitialize [
	
	|list|
	list:= SBList new:'text'.
	self assertCollection: list items hasSameElements: #(). 
]

{ #category : #test }
SBListTest >> testItems [

	|list link|
	link:= SBLink new: 'text' href:'http://page'. 
	list:= SBList new:'text'.
	list items: #(link).
	self assertCollection: list items hasSameElements: #(link). 
]

{ #category : #test }
SBListTest >> testStyle [

	self flag: #toImplement.
	self assert: false
]

{ #category : #test }
SBListTest >> testStyleItem [

	|list title|
	title:= SBTitle new: 'text'. 
	list:= SBList new:'text'.
	self assert: (list styleItem: title) equals: '<ul class="SBItemList">',title style,'</ul>'
]
