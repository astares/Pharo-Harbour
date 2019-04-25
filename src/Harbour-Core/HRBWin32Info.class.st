Class {
	#name : #HRBWin32Info,
	#superclass : #Object,
	#classVars : [
		'IconCache'
	],
	#category : #'Harbour-Core-Utilities'
}

{ #category : #'as yet unclassified' }
HRBWin32Info class >> getVolumeInfo: driveLetter [

	| buffer |
	name := (driveLetter, ':\\') asWin32WideString.
	buffer := Win32WideString new: 256.
	self getVolumeInfo: name into: buffer size: 256.
	^buffer asString
	 
]

{ #category : #'as yet unclassified' }
HRBWin32Info class >> getVolumeInfo: volumeName into: lpBuffer size: nSize [
	"Primitive to obtain an environment variable using windows Wide Strings"
	^ self ffiCall: #(boolean GetVolumeInformationW (Win32WideString volumeName, Win32WideString lpBuffer, ulong nSize, nil, nil, nil, nil, 0))
]
