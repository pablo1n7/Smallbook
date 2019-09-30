Class {
	#name : #SBCode,
	#superclass : #SBComponent,
	#category : #Smallbook
}

{ #category : #action }
SBCode >> style [
	"Returns the HTML code needed to add a block of highlighted code in a slide."
	^'<pre class="smalltalk SBCode"><code>', self text,'</code></pre><script>format()</script>'

]
