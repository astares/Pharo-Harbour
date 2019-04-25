"
Presenter for a folder structure
"
Class {
	#name : #HRBFolderStructurePresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'tree'
	],
	#category : #'Harbour-UI-Components'
}

{ #category : #specs }
HRBFolderStructurePresenter class >> defaultSpec [

	^ SpecBoxLayout newVertical
		add: #tree;
		yourself
]

{ #category : #specs }
HRBFolderStructurePresenter class >> open [ 
	<script>
	self new openWithSpec 
]

{ #category : #initialization }
HRBFolderStructurePresenter >> initializeWidgets [
	tree := self newTreeTable.

	tree
		addColumn:
			(CompositeTableColumn new
				title: self title;
				addColumn:
					(ImageTableColumn new
						width: 20;
						evaluated: #icon;
						yourself);
				addColumn:
					(StringTableColumn new
						evaluated: #label;
						yourself);
				yourself);
	 
		roots: HRBFileSystemItemWrapper roots;
		children: [ :aClass | aClass subdirectories ];
		beResizable
]

{ #category : #initialization }
HRBFolderStructurePresenter >> title [
	^Smalltalk os isWindows 
		ifTrue: ' Drives and Folders' 
  		ifFalse: ' Folders' 
	
]
