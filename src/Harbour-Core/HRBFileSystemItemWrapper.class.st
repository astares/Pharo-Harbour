"
Abstract superclass to wrap items found in file system
"
Class {
	#name : #HRBFileSystemItemWrapper,
	#superclass : #Object,
	#instVars : [
		'fileReference'
	],
	#category : #'Harbour-Core-Wrappers'
}

{ #category : #accessing }
HRBFileSystemItemWrapper class >> icon [ 
	^self iconProvider folderIcon 
]

{ #category : #accessing }
HRBFileSystemItemWrapper class >> iconProvider [ 

	^HRBIconCache 
]

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
HRBFileSystemItemWrapper class >> systemIcon [

	^self isAbstract ifTrue: [ super systemIcon ] ifFalse: [ self icon ]
]

{ #category : #accessing }
HRBFileSystemItemWrapper >> allElements [  
	
	^(OrderedCollection withAll: self subdirectories) 
		addAll: self files; 
		yourself
]

{ #category : #conversion }
HRBFileSystemItemWrapper >> asFileReference [ 

	^self fileReference
]

{ #category : #actions }
HRBFileSystemItemWrapper >> browseFolder [
	fileReference openInOSFileBrowser 
]

{ #category : #'private - accessing' }
HRBFileSystemItemWrapper >> directories [ 
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

{ #category : #accessing }
HRBFileSystemItemWrapper >> files [ 
	
	^[fileReference files collect: [:each | HRBFileWrapper on: each ] ]
		on: FileException 
		do: [ #() ]
]

{ #category : #accessing }
HRBFileSystemItemWrapper >> icon [

	^self class icon
]

{ #category : #testing }
HRBFileSystemItemWrapper >> isDirectory [

	^false
]

{ #category : #testing }
HRBFileSystemItemWrapper >> isFile [

	^false
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
HRBFileSystemItemWrapper >> pathString [
 
	| path |
	path := self fileReference fullPath pathString.
	^Smalltalk os isWindows ifTrue: [ path allButFirst copyReplaceAll: '/' with: '\' ]
		ifFalse: [ path ]
]

{ #category : #'private - accessing' }
HRBFileSystemItemWrapper >> size [ 
	^''
]

{ #category : #accessing }
HRBFileSystemItemWrapper >> subdirectories [ 
	
	^self directories collect: [:each | HRBDirectoryWrapper on: each ] 
]
