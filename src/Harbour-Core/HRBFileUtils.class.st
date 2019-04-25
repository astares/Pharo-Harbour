"
File utilities
"
Class {
	#name : #HRBFileUtils,
	#superclass : #Object,
	#classVars : [
		'IconCache'
	],
	#category : #'Harbour-Core-Utilities'
}

{ #category : #testing }
HRBFileUtils class >> representsShortWindowsDrive: aString [
	"Solve later with a regexp
	
 	  HRBFileUtils representsShortWindowsDrive: 'C:'
	"
	aString first isLetter ifFalse: [ ^false ].
	aString first isUppercase ifFalse: [ ^false ].
	aString size = 2 ifTrue: [ ^aString second = $: ].
	^false
]
