"
Utility to access Win32 functions
"
Class {
	#name : #HRBWin32Info,
	#superclass : #Object,
	#classVars : [
		'IconCache'
	],
	#category : #'Harbour-Core-Utilities'
}

{ #category : #examples }
HRBWin32Info class >> example [

	(self getVolumeInfo: 'C:') inspect
]

{ #category : #accessing }
HRBWin32Info class >> getVolumeInfo: driveLetter [

	| buffer driveName |
	driveName := (driveLetter, '\\') asWin32WideString.
	buffer := Win32WideString new: 256.
	self getVolumeInfo: driveName into: buffer size: 256.
	^buffer asString
	 
]

{ #category : #'private-ffi' }
HRBWin32Info class >> getVolumeInfo: volumeName into: lpBuffer size: nSize [
	"Primitive to obtain an environment variable using windows Wide Strings"
	^ self ffiCall: #(uint GetVolumeInformationW (Win32WideString volumeName, Win32WideString lpBuffer, ulong nSize, nil, nil, nil, nil, 0)) module: #kernel32
]
