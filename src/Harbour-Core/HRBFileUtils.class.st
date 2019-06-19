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

{ #category : #'private - testing' }
HRBFileUtils class >> isLinux [
	^Smalltalk os version beginsWith: 'linux'
]

{ #category : #'private - testing' }
HRBFileUtils class >> isMac [ 
	^Smalltalk os isMacOS
]

{ #category : #'private - testing' }
HRBFileUtils class >> isWindows [ 
	^Smalltalk os isWindows
]

{ #category : #'private - actions' }
HRBFileUtils class >> openLinuxTerminalOn: aPath [

	(Delay forMilliseconds: 1000) wait.  	
	(LibC system: 'gnome-terminal --working-directory=',aPath,' &')
	
 
]

{ #category : #'private - actions' }
HRBFileUtils class >> openMacTerminalOn: aPath [

	| escaped |
	escaped := aPath copyReplaceAll: ' ' with: '\ '. 	
	LibC system: 'open -a Terminal ', escaped
]

{ #category : #actions }
HRBFileUtils class >> openTerminalOn: aPath [

	self isWindows 
		ifTrue: [ ^self openWindowsTerminalOn: aPath ].
	self isMac
		ifTrue: [ ^self openMacTerminalOn: aPath ].
	self isLinux
		ifTrue: [ ^self openLinuxTerminalOn: aPath ].
	
	self inform: 'No terminal for platform implemented'		

]

{ #category : #'private - actions' }
HRBFileUtils class >> openWindowsTerminalOn: aPath [

	^LibC system: 'start cmd.exe /K "cd /d ', aPath, '"'
]

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
