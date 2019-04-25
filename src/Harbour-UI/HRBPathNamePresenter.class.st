"
Presenter for path name
"
Class {
	#name : #HRBPathNamePresenter,
	#superclass : #ComposablePresenter,
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
	^SpecBoxLayout newHorizontal 
	 
		add: #label withConstraints: [ :constraints | constraints width: 40 ];
		add: #text;
		add: #button withConstraints: [ :constraints | constraints width: 30 ];
		yourself
]

{ #category : #initialization }
HRBPathNamePresenter >> initializeWidgets [
	label := self newLabel label: 'Path:'.
	text := self newTextInput.
	button := self newButton.
	button 
		label: '...';
		action: [ self openNativeFileBrowser ]
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
