"
Presenter for path name
"
Class {
	#name : #HRBPathNamePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tree',
		'text',
		'label',
		'button'
	],
	#category : #'Harbour-UI-Components'
}

{ #category : #specs }
HRBPathNamePresenter class >> defaultSpec [ 
	^ SpBoxLayout newHorizontal 	
		add: #label withConstraints: [ :constraints | constraints width: 40 ];
		add: #text;		
		yourself
]

{ #category : #initialization }
HRBPathNamePresenter >> initializeWidgets [
	label := self newLabel label: 'Path:'.
	text := self newTextInput 
]

{ #category : #actions }
HRBPathNamePresenter >> openNativeFileBrowser [
	| path |
	path := self pathName.
	path isEmpty ifTrue: [ ^self inform: 'No path selected' ].
	(HRBFileUtils representsShortWindowsDrive: path) ifTrue: [ path := path , '\' ].
	OSPlatform current openNativeBrowserOn: path asFileReference 
]

{ #category : #initialization }
HRBPathNamePresenter >> pathName [
	^text text
]

{ #category : #initialization }
HRBPathNamePresenter >> pathName: aString [

	text text: aString
]
