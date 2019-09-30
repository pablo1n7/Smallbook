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
	#category : #Smallbook
}

{ #category : #'instance creation' }
SBServer class >> new: aPort [
	"Creates a new server instance ready to serve in the specified port."

	|server|
	server := self new.
	server port: aPort.
	^server
]

{ #category : #'instance creation' }
SBServer class >> new: aPort staticFolder: aPath [
	"Creates a new server instance ready to serve in the specified port and from the specified static folder."

	|server|
	server := self new: aPort.
	server staticFolder: aPath.
	^server
]

{ #category : #action }
SBServer >> addSlide: aSlide [
	"Adds a new slide."
	aSlide index: ((self slides size) +1).
	self slides add: aSlide.
]

{ #category : #accessing }
SBServer >> delegator [
	"Returns the server delegator"
	^ delegator
]

{ #category : #accessing }
SBServer >> delegator: anObject [
	"Sets a delegator for the server"
	delegator := anObject
]

{ #category : #accessing }
SBServer >> host [
	"Returns the host name."
	^ host
]

{ #category : #accessing }
SBServer >> host: anObject [
	"Sets the host name."
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
	"Returns the server's port."
	^ port
]

{ #category : #accessing }
SBServer >> port: anObject [
	"Sets the server's port."
	port := anObject
]

{ #category : #action }
SBServer >> root: aRoot slide: aSlide size: aSize [
	"comment stating purpose of message"
	self delegator map: ('',aRoot asString,'.html') to: [ :request | ZnResponse ok: (ZnEntity html: (aSlide style: aSize))]
]

{ #category : #action }
SBServer >> saveHTML: aPath [
	"Saves the slides in .html files in the specified path."
	(self slides) do: [ :each | each saveHTML:(self slides size) in:aPath].
]

{ #category : #accessing }
SBServer >> server [
	"Returns the server instance"
	^ server
]

{ #category : #accessing }
SBServer >> server: anObject [
	"Sets a new server"
	server := anObject
]

{ #category : #accessing }
SBServer >> slides [
	"Returns the slides"
	^ slides
]

{ #category : #accessing }
SBServer >> slides: anObject [
	"Sets the slides"
	slides := anObject
]

{ #category : #action }
SBServer >> start [
	"Starts the server and opens the slides in a web browser."
	self startwithoutBrowser.
	WebBrowser openOn:('http:/',self host,':',self port asString).	
]

{ #category : #action }
SBServer >> startwithoutBrowser [
	"Starts the server without opening the browser."
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
	"Returns the static folder."
	^ staticFolder
]

{ #category : #accessing }
SBServer >> staticFolder: anObject [
	"Sets a static folder."
	staticFolder := anObject
]

{ #category : #action }
SBServer >> stop [
	"Stops the server instance."
	self server stop.
]
