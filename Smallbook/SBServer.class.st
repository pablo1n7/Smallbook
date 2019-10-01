Class {
	#name : #SBServer,
	#superclass : #Object,
	#instVars : [
		'host',
		'port',
		'slides',
		'server',
		'delegator',
		'staticFolder'
	],
	#category : #'Smallbook-Core'
}

{ #category : #'instance creation' }
SBServer class >> new: aPort [
	"comment stating purpose of message"

	|server|
	server := self new.
	server port: aPort.
	^server
]

{ #category : #'instance creation' }
SBServer class >> new: aPort staticFolder: aPath [
	"comment stating purpose of message"

	|server|
	server := self new: aPort.
	server staticFolder: aPath.
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
	"This message initializes the server"
	
	|staticFileServerDelegate path |
	self slides: OrderedCollection new.
	self host: 'localhost'.
	self delegator: ZnDefaultServerDelegate new.
	path := (((FileLocator imageDirectory) / 'pharo-local/iceberg/pablo1n7/Smallbook/StaticFiles') pathString).
	staticFileServerDelegate :=  ZnStaticFileServerDelegate new directory: path asFileReference; 
	prefixFromString: 'static-files'.
		
	self delegator prefixMap 
			at: 'static-files'
         put: [ :request | staticFileServerDelegate handleRequest: request].
	self delegator
			map: '/'
         to:'1.html'.
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
	self delegator map: ('',aRoot asString,'.html') to: [ :request | ZnResponse ok: (ZnEntity html: (aSlide style: aSize))]
]

{ #category : #action }
SBServer >> saveHTML: aPath [
	"comment stating purpose of message"
	|staticPath exportPath|
	(aPath last = '/') ifTrue:[exportPath:=aPath,'exportHTML/']; 
									ifFalse:[exportPath:=aPath, '/exportHTML/'].
	
	(FileSystem disk / exportPath) exists ifTrue:[(FileSystem disk / exportPath) deleteAll.].
	staticPath:=(((FileLocator imageDirectory) / 'pharo-local/iceberg/pablo1n7/Smallbook/StaticFiles') pathString).
	(FileSystem disk / staticPath) copyAllTo: FileSystem disk / (exportPath,'static-files').
	(FileSystem disk / self staticFolder) copyAllTo: FileSystem disk / (exportPath,'static-user').
	(self slides) do: [ :each | each saveHTML:(self slides size) in:exportPath].
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
	self startwithoutBrowser.
	WebBrowser openOn:('http:/',self host,':',self port asString).	
]

{ #category : #action }
SBServer >> startwithoutBrowser [
	| staticFileUserServerDelegate |
	self server:(ZnServer startDefaultOn: self port).	 
	(self staticFolder) ifNotNil: [ 
		staticFileUserServerDelegate :=  ZnStaticFileServerDelegate new directory: (self staticFolder) 		asFileReference; 
		prefixFromString: 'static-user'.
		self delegator prefixMap 
			at: 'static-user'
         put: [ :request | staticFileUserServerDelegate handleRequest: request].
	 
	].
	(self slides) do:[:each | self root: (each index) asString slide: each size:(self slides) size].
	self server delegate: self delegator.	
]

{ #category : #accessing }
SBServer >> staticFolder [
	^ staticFolder
]

{ #category : #accessing }
SBServer >> staticFolder: anObject [
	staticFolder := anObject
]

{ #category : #action }
SBServer >> stop [

	self server stop.
]
