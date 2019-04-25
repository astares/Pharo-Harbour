"
A root drive as found on Windows
"
Class {
	#name : #HRBRootDriveWrapper,
	#superclass : #HRBFileSystemItemWrapper,
	#category : #'Harbour-Core-Wrappers'
}

{ #category : #accessing }
HRBRootDriveWrapper class >> icon [ 
	^self iconProvider driveIcon
]

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

	^self volumeName, ' (' ,super label, ')'
]

{ #category : #accessing }
HRBRootDriveWrapper >> volumeName [

	^HRBWin32Info getVolumeInfo: self fileReference basename
]
