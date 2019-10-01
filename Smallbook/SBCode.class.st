Class {
	#name : #SBCode,
	#superclass : #SBComponent,
	#category : #'Smallbook-Core'
}

{ #category : #action }
SBCode >> style [
	"comment stating purpose of message"
	^'<pre class="smalltalk SBCode"><code>', self text,'</code></pre><script>format()</script>'

]
