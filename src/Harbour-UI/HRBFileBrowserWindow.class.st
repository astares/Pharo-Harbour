"
Main UI window for the file browser
"
Class {
	#name : #HRBFileBrowserWindow,
	#superclass : #SpPresenter,
	#instVars : [
		'menu',
		'statusBar',
		'toolBar',
		'folderStructurPresenter',
		'pathNamePresenter',
		'folderContentPresenter'
	],
	#category : #'Harbour-UI-Windows'
}

{ #category : #specs }
HRBFileBrowserWindow class >> defaultSpec [
	^ SpBoxLayout newVertical 		 
		 add: #pathNamePresenter withConstraints: [:constraints | constraints height: self buttonHeight ];
		 add: (SpPanedLayout newHorizontal
				position: 30 percent;
				add: #folderStructurPresenter;
				add: #folderContentPresenter;
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
		addItem: [ :item | item name: 'Browse'; action: [ self openNativeFileBrowser ] ];	 
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
		
	^ SpToolbarButtonPresenter new
		label: 'Back';
		icon: (self iconNamed: #back);
		help: 'Navigate to previous';
		action: [ self pushMessage ];
		yourself
]

{ #category : #'private - building' }
HRBFileBrowserWindow >> buildNavigateForwardToolBarItem [
		
	^ SpToolbarButtonPresenter new
		label: 'Forward';
		icon: (self iconNamed: #forward);
		help: 'Navigate to previous item';
		action: [ self pushMessage ];
		yourself
]

{ #category : #'private - building' }
HRBFileBrowserWindow >> buildOpenNativeFileBrowserToolBarItem [
		
	^ SpToolbarButtonPresenter new
		label: 'Browse';
		icon: HRBIconCache folderIcon;
		help: 'Open file browser';
		action: [ self openNativeFileBrowser ];
		yourself
]

{ #category : #'private - building' }
HRBFileBrowserWindow >> buildOpenTerminalToolBarItem [
		
	^ SpToolbarButtonPresenter new
		label: 'Terminal';
		icon: HRBIconCache terminalIcon;
		help: 'Open terminal';
		action: [ self openTerminal ];
		yourself
]

{ #category : #'private - building' }
HRBFileBrowserWindow >> buildStatusBar [

	^ SpStatusBarPresenter new
]

{ #category : #'private - building' }
HRBFileBrowserWindow >> buildToolBar [
	
	^ self newToolbar 
		addItem: self buildNavigateBackToolBarItem;
		addItem: self buildNavigateForwardToolBarItem;		
		addItem: self buildOpenNativeFileBrowserToolBarItem;			
		addItem: self buildOpenTerminalToolBarItem "position: ToolBarItemPosition right";				
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
	folderContentPresenter := self instantiate: HRBFolderContentPresenter.
	
	folderStructurPresenter whenFolderChangedDo: [:folder | 
		pathNamePresenter pathName: folder pathString.
		folderContentPresenter folder: folder ].

	folderContentPresenter whenItemsChangedDo: [:items | 
		self statusBar pushMessage: (self statusTextFor: items)
	]
]

{ #category : #initialization }
HRBFileBrowserWindow >> initializeWindow: aWindowPresenter [
	"I'm called whenever the component will be displayed in a window (or dialog). 
	 This is usually attained sending #openWithSpec or #openDialogWithSpec."
	
	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		menu: (menu := self buildMenuBar);
		toolbar: (toolBar := self buildToolBar);
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
HRBFileBrowserWindow >> openNativeFileBrowser [

	pathNamePresenter openNativeFileBrowser
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

{ #category : #'private - accessing' }
HRBFileBrowserWindow >> statusTextFor: aCollection [ 
	 
	| onlyFiles text |
	onlyFiles := aCollection allSatisfy: [:each | each isFile].
	text := String streamContents: [:s | 
		s nextPutAll: aCollection size asString.
		s nextPutAll: ' element'.
      aCollection size > 1 ifTrue: [ s nextPut: $s ].	"handle plural"
		s nextPutAll: ' selected'		
	].
	^text
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
