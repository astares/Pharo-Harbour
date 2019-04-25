"
Main UI window for the file browser
"
Class {
	#name : #HRBFileBrowserWindow,
	#superclass : #ComposablePresenter,
	#instVars : [
		'menu',
		'statusBar',
		'toolBar',
		'folderStructurPresenter',
		'pathNamePresenter'
	],
	#category : #'Harbour-UI-Windows'
}

{ #category : #specs }
HRBFileBrowserWindow class >> defaultSpec [
	^ SpecBoxLayout newVertical 		 
		 add: #pathNamePresenter withConstraints: [:constraints | constraints height: self buttonHeight ];
		 add: (SpecPanedLayout newHorizontal
				position: 30 percent;
				add: #folderStructurPresenter;
				 
				yourself);
		yourself		
]

{ #category : #accessing }
HRBFileBrowserWindow class >> icon [ 
	^HRBIconCache driveIcon
]

{ #category : #'world menu' }
HRBFileBrowserWindow class >> menuCommandOn: aBuilder [ 
	<worldMenu> 
	(aBuilder item: #'File Manager')
		parent: #'Tools';
		help: 'File Manager';
		action: [ self open ]; 
		order: 3.0; 
		icon: self icon. 
	
]

{ #category : #showing }
HRBFileBrowserWindow class >> open [
	<script>

	self new openWithSpec
]

{ #category : #accessing }
HRBFileBrowserWindow class >> systemIcon [ 
	^self icon
]

{ #category : #accessing }
HRBFileBrowserWindow class >> taskbarIcon [ 
	^self icon
]

{ #category : #'private - building' }
HRBFileBrowserWindow >> buildExtrasMenu [

	^ self newMenu
		addItem: [ :item | item name: 'Open Terminal'; action: [ self openTerminal ] ];	 
		yourself
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
		addGroup: [ :group | 
			group addItem: [ :item | 
					item
						name: 'File';
						subMenu: self buildFileMenu ].
			group addItem: [ :item | 
					item
						name: 'Extras';
						subMenu: self buildExtrasMenu ] ]
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
		label: 'Forward';
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
	pathNamePresenter := self instantiate: HRBPathNamePresenter.
	folderStructurPresenter := self instantiate: HRBFolderStructurePresenter.
	
	folderStructurPresenter whenFolderChangedDo: [:folder | pathNamePresenter pathName: folder pathString ]
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
HRBFileBrowserWindow >> openTerminal [

	HRBFileUtils openTerminalOn: pathNamePresenter pathName
	
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
