"
A simple file browser for Pharo written by T.Bergmann (aka ""astares"")
"
Class {
	#name : #BaselineOfHarbour,
	#superclass : #BaselineOf,
	#category : #'BaselineOfHarbour-Manifest'
}

{ #category : #baseline }
BaselineOfHarbour >> baseline: spec [
	<baseline>
	spec
		for: #common do: [
			"Packages"
			spec 
				package: 'Harbour-Core';
				package: 'Harbour-UI' with: [ spec requires: #('Harbour-Core') ].
			
			"Groups"	
			spec	
				group: 'Core' with: #('Harbour-Core');
				group: 'UI' with: #('Harbour-UI');
				group: 'all' with: #('Core' 'UI');
				group: 'default' with: #('all')	
	]
]
