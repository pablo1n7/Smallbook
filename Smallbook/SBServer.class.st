Class {
	#name : #SBServer,
	#superclass : #Object,
	#instVars : [
		'host',
		'port',
		'slides',
		'server',
		'delegator'
	],
	#category : #Smallbook
}

{ #category : #'instance creation' }
SBServer class >> new: aPort [
	"comment stating purpose of message"

	|server|
	server := self new.
	server port: aPort.
	^server
]

{ #category : #action }
SBServer >> addSlide: aSlide [
	"comment stating purpose of message"
	aSlide index: ((self slides size) +1).
	self slides add: aSlide.
]

{ #category : #accessing }
SBServer >> delegator [
	^ delegator
]

{ #category : #accessing }
SBServer >> delegator: anObject [
	delegator := anObject
]

{ #category : #accessing }
SBServer >> host [
	^ host
]

{ #category : #accessing }
SBServer >> host: anObject [
	host := anObject
]

{ #category : #initialization }
SBServer >> initialize [ 
	"comment stating purpose of message"

	self slides: OrderedCollection new.
	self host: 'localhost'.
	self delegator:ZnDispatcherDelegate new.
]

{ #category : #accessing }
SBServer >> port [
	^ port
]

{ #category : #accessing }
SBServer >> port: anObject [
	port := anObject
]

{ #category : #action }
SBServer >> root: aRoot slide: aSlide size: aSize [
	"comment stating purpose of message"
	self delegator map: ('',aRoot asString) to: [ :request | ZnResponse ok: (ZnEntity html: (aSlide style: aSize))]
]

{ #category : #accessing }
SBServer >> server [
	^ server
]

{ #category : #accessing }
SBServer >> server: anObject [
	server := anObject
]

{ #category : #accessing }
SBServer >> slides [
	^ slides
]

{ #category : #accessing }
SBServer >> slides: anObject [
	slides := anObject
]

{ #category : #action }
SBServer >> start [
	self server:(ZnServer startDefaultOn: self port).	 
	(self slides) do:[:each | self root: (each index) asString slide: each size:(self slides) size].
	self server delegate: self delegator.
]

{ #category : #action }
SBServer >> stop [

	self server stop.
]
