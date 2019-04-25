"
Main UI window for the file browser
"
Class {
	#name : #HRBFileBrowserWindow,
	#superclass : #ComposablePresenter,
	#instVars : [
		'menu',
		'statusBar',
		'toolBar'
	],
	#category : #'Harbour-UI-Windows'
}

{ #category : #specs }
HRBFileBrowserWindow class >> defaultSpec [
	^ SpecBoxLayout newVertical
		 
]

{ #category : #showing }
HRBFileBrowserWindow class >> open [
	<script>

	self new openWithSpec
]

{ #category : #'private - building' }
HRBFileBrowserWindow >> buildFileMenu [

	^ self newMenu
		addItem: [ :item | item name: 'Set status text'; action: [ self pushMessage ] ];	 
		yourself
]

{ #category : #'private - building' }
HRBFileBrowserWindow >> buildMenuBar [

	^ self newMenuBar
		addGroup: [ :group | group
			addItem: [ :item | item name: 'File'; subMenu: self buildFileMenu ] ]
]

{ #category : #'private - building' }
HRBFileBrowserWindow >> buildNavigateBackToolBarItem [
		
	^ ToolBarButton new
		label: 'Back';
		icon: (self iconNamed: #back);
		help: 'Navigate to previous';
		action: [ self pushMessage ];
		yourself
]

{ #category : #'private - building' }
HRBFileBrowserWindow >> buildNavigateForwardToolBarItem [
		
	^ ToolBarButton new
		label: 'Back';
		icon: (self iconNamed: #forward);
		help: 'Navigate to previous item';
		action: [ self pushMessage ];
		yourself
]

{ #category : #'private - building' }
HRBFileBrowserWindow >> buildStatusBar [

	^ StatusBarPresenter new
]

{ #category : #'private - building' }
HRBFileBrowserWindow >> buildToolBar [
	
	^ self newToolBar 
		addItem: self buildNavigateBackToolBarItem;
		addItem: self buildNavigateForwardToolBarItem;		
		yourself
]

{ #category : #defaults }
HRBFileBrowserWindow >> initialExtent [ 
	^ 700 @ 500
]

{ #category : #initialization }
HRBFileBrowserWindow >> initializeWidgets [
	
	
]

{ #category : #initialization }
HRBFileBrowserWindow >> initializeWindow: aWindowPresenter [
	"I'm called whenever the component will be displayed in a window (or dialog). 
	 This is usually attained sending #openWithSpec or #openDialogWithSpec."
	
	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		menu: (menu := self buildMenuBar);
		toolBar: (toolBar := self buildToolBar);
		statusBar: (statusBar := self buildStatusBar).

	self statusBar pushMessage: 'Ready'	
]

{ #category : #'accessing - ui' }
HRBFileBrowserWindow >> menu [
	^ menu
]

{ #category : #'accessing - ui' }
HRBFileBrowserWindow >> menu: anObject [
	^ menu := anObject
]

{ #category : #showing }
HRBFileBrowserWindow >> open [ 
	<script: 'self open'>
	self class open
]

{ #category : #actions }
HRBFileBrowserWindow >> pushMessage [
	
	statusBar pushMessage: 'HelloWorld'
]

{ #category : #'accessing - ui' }
HRBFileBrowserWindow >> statusBar [
	^ statusBar
]

{ #category : #'accessing - ui' }
HRBFileBrowserWindow >> statusBar: anObject [
	^ statusBar := anObject
]

{ #category : #defaults }
HRBFileBrowserWindow >> title [ 

   ^'File browser'
]

{ #category : #'accessing - ui' }
HRBFileBrowserWindow >> toolBar [
	^ toolBar
]

{ #category : #'accessing - ui' }
HRBFileBrowserWindow >> toolBar: anObject [
	^ toolBar := anObject
]
