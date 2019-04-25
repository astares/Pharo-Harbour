"
A root drive as found on Windows
"
Class {
	#name : #HRBRootDriveWrapper,
	#superclass : #HRBFileSystemItemWrapper,
	#category : #'Harbour-Core-Utilities'
}

{ #category : #'private accessing' }
HRBRootDriveWrapper >> children [ 
	^(fileReference basename, '\') asFileReference directories
]

{ #category : #testing }
HRBRootDriveWrapper >> isRoot [ 
	^true
]

{ #category : #accessing }
HRBRootDriveWrapper >> label [

	^super label, '/'
]
