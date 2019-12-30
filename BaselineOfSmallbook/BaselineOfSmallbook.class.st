Class {
	#name : #BaselineOfSmallbook,
	#superclass : #BaselineOf,
	#category : #BaselineOfSmallbook
}

{ #category : #baselines }
BaselineOfSmallbook >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec package: 'Smallbook'.
			spec group: 'default' with: #('Smallbook') ]
]
