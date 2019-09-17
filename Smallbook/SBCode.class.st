Class {
	#name : #SBCode,
	#superclass : #SBComponent,
	#category : #Smallbook
}

{ #category : #action }
SBCode >> style [
	"comment stating purpose of message"
	"^'<p class=SBCode>',self text,'</p>'."
	^'<pre class="smalltalk SBCode"><code>', self text,'</code></pre><script>format()</script>'

]
