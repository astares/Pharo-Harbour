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

{ #category : #'private - accessing' }
HRBFileSystemItemWrapper >> children [ 
	[ self fileReference directories ] on: Exception do: [ ^#()].
	^self fileReference directories
]

{ #category : #'private - accessing' }
HRBFileSystemItemWrapper >> fileReference [
	^ fileReference
]

{ #category : #'private - accessing' }
HRBFileSystemItemWrapper >> fileReference: anObject [
	fileReference := anObject
]

{ #category : #testing }
HRBFileSystemItemWrapper >> isRoot [ 
	^false
]

{ #category : #accessing }
HRBFileSystemItemWrapper >> label [ 
	^self fileReference basename
]

{ #category : #accessing }
HRBFileSystemItemWrapper >> subdirectories [ 
	
	^self children collect: [:each | HRBDirectoryWrapper on: each ] 
]
