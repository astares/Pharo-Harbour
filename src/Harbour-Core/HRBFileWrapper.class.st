"
A file wrapper
"
Class {
	#name : #HRBFileWrapper,
	#superclass : #HRBFileSystemItemWrapper,
	#category : #'Harbour-Core-Wrappers'
}

{ #category : #accessing }
HRBFileWrapper >> size [

	^fileReference size asString
]
