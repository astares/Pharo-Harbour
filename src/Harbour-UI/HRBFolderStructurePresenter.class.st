"
Presenter for a folder structure
"
Class {
	#name : #HRBFolderStructurePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tree'
	],
	#category : #'Harbour-UI-Components'
}

{ #category : #specs }
HRBFolderStructurePresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #tree;
		yourself
]

{ #category : #specs }
HRBFolderStructurePresenter class >> open [ 
	<script>
	self new openWithSpec 
]

{ #category : #actions }
HRBFolderStructurePresenter >> browseFolder [
	 tree selectedItem browseFolder 
]

{ #category : #'menu handling' }
HRBFolderStructurePresenter >> folderContextMenu [

	^(SpMenuPresenter new
		addGroup: [ :group | group
			addItem: [ :item | item name: 'Open in native browser';  action: [ self browseFolder ]]
		])
]

{ #category : #initialization }
HRBFolderStructurePresenter >> initializeWidgets [
	tree := self newTreeTable.
	tree
		addColumn:
			(SpCompositeTableColumn new
				title: self title;
				addColumn:
					(SpImageTableColumn new
						width: 20;
						evaluated: #icon;
						yourself);
				addColumn:
					(SpStringTableColumn new
						evaluated: #label;
						yourself);
				yourself);
	 
		roots: HRBFileSystemItemWrapper roots;
		children: [ :aClass | aClass subdirectories ];
		beResizable.
	tree contextMenu: self folderContextMenu		
]

{ #category : #initialization }
HRBFolderStructurePresenter >> title [
	^Smalltalk os isWindows 
		ifTrue: ' Drives and Folders' 
  		ifFalse: ' Folders' 
	
]

{ #category : #'api-events' }
HRBFolderStructurePresenter >> whenFolderChangedDo: aBlock [
	
	tree whenSelectionChangedDo: [:sel | aBlock cull: sel selectedItem ]
]
