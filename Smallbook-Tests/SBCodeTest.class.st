"
A SBCodeTest is a test class for testing the behavior of SBCode
"
Class {
	#name : #SBCodeTest,
	#superclass : #TestCase,
	#category : #'Smallbook-Tests'
}

{ #category : #test }
SBCodeTest >> testStyle [

	|code htmlCode|	
	code := SBCode new:'
	|temp|
	temp:=3.
	' .
	htmlCode:='<pre class="smalltalk SBCode"><code>', code text,'</code></pre><script>format()</script>'.
	self assert: code style equals:htmlCode.
]
