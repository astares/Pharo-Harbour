"
Abstract superclass to wrap items found in file system
"
Class {
	#name : #HRBFileSystemItemWrapper,
	#superclass : #Object,
	#instVars : [
		'fileReference'
	],
	#category : #'Harbour-Core-Utilities'
}

{ #category : #testing }
HRBFileSystemItemWrapper class >> isAbstract [ 

	^self name = #HRBFileSystemItemWrapper
]

{ #category : #'instance creation' }
HRBFileSystemItemWrapper class >> on: aFileReference [

	^(self new)
		fileReference: aFileReference;
		yourself
]

{ #category : #accessing }
HRBFileSystemItemWrapper class >> roots [

	^Smalltalk os isWindows
		ifTrue: [ FileSystem root directories collect: [:each | HRBRootDriveWrapper on: each ]]
		ifFalse: [ Array with: (HRBRootDirectoryWrapper on: FileSystem root) ]
]

{ #category : #accessing }
HRBFileSystemItemWrapper >> fileReference [
	^ fileReference
]

{ #category : #accessing }
HRBFileSystemItemWrapper >> fileReference: anObject [
	fileReference := anObject
]

{ #category : #testing }
HRBFileSystemItemWrapper >> isRoot [ 
	^false
]
