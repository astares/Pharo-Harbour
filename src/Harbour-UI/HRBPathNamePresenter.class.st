"
Presenter for path name
"
Class {
	#name : #HRBPathNamePresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'tree',
		'text',
		'label'
	],
	#category : #'Harbour-UI-Components'
}

{ #category : #specs }
HRBPathNamePresenter class >> defaultSpec [ 
	^SpecPanedLayout newHorizontal 
		position: 10 percent;
		add: #label;
		add: #text;
		yourself
]

{ #category : #initialization }
HRBPathNamePresenter >> initializeWidgets [
	label := self newLabel label: 'Path:'.
	text := self newTextInput 
]

{ #category : #initialization }
HRBPathNamePresenter >> pathName: aString [

	text text: aString
]
