"
Show the content of a folder as list
"
Class {
	#name : #HRBFolderContentPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'list'
	],
	#category : #'Harbour-UI-Components'
}

{ #category : #specs }
HRBFolderContentPresenter class >> defaultSpec [

	^ SpecPanedLayout newVertical
		position: 30 percent;
		add: #list;
		yourself
]

{ #category : #initialization }
HRBFolderContentPresenter >> initializeWidgets [
	
	list := self newList 
]
