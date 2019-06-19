"
A file wrapper
"
Class {
	#name : #HRBFileWrapper,
	#superclass : #HRBFileSystemItemWrapper,
	#category : #'Harbour-Core-Wrappers'
}

{ #category : #accessing }
HRBFileWrapper class >> icon [ 
	^self iconProvider fileIcon 
]

{ #category : #testing }
HRBFileWrapper >> isFile [

	^true
]

{ #category : #accessing }
HRBFileWrapper >> size [
	"See https://github.com/pharo-project/pharo/issues/3571"
	
	^[ fileReference size asString ] on: FileDoesNotExistException do: [ 0 ]
]
