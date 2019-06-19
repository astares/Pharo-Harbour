"
Show the content of a folder as list
"
Class {
	#name : #HRBFolderContentPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'table',
		'folder'
	],
	#category : #'Harbour-UI-Components'
}

{ #category : #specs }
HRBFolderContentPresenter class >> defaultSpec [

	^ SpecPanedLayout newVertical
		position: 30 percent;
		add: #table;
		yourself
]

{ #category : #examples }
HRBFolderContentPresenter class >> example [

	^self openOn: FileSystem workingDirectory
]

{ #category : #'instance creation' }
HRBFolderContentPresenter class >> on: aFileReference [

	^(self new)
		folder: (HRBFileSystemItemWrapper on: aFileReference);
		yourself
]

{ #category : #show }
HRBFolderContentPresenter class >> openOn: aFileReference [

	(self on: aFileReference) openWithSpec
]

{ #category : #accessing }
HRBFolderContentPresenter >> folder [
	^ folder
]

{ #category : #accessing }
HRBFolderContentPresenter >> folder: anObject [
	folder := anObject.
   self table items: folder allElements
	
]

{ #category : #initialization }
HRBFolderContentPresenter >> initializeWidgets [
	
	self table	
		 
		addColumn: (CompositeTableColumn new
				title: 'File Name';
				addColumn:
					(ImageTableColumn new
						width: 20;
						evaluated: #icon;
						yourself);
				addColumn:
					(StringTableColumn new
						evaluated: [:each | ' ',each label];
						yourself);
				yourself);
		
		
		
		addColumn: (StringTableColumn title: 'Size' evaluated: #size)
]

{ #category : #accessing }
HRBFolderContentPresenter >> table [

	^table ifNil: [ table := self newTable ]
]

{ #category : #'api-events' }
HRBFolderContentPresenter >> whenItemChangedDo: aBlock [
	
	table whenSelectionChangedDo: [:sel | aBlock cull: sel selectedItem ]
]
