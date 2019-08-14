"
Show the content of a folder as list
"
Class {
	#name : #HRBFolderContentPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'table',
		'folder',
		'detail'
	],
	#category : #'Harbour-UI-Components'
}

{ #category : #specs }
HRBFolderContentPresenter class >> defaultSpec [

	^ SpPanedLayout newVertical
		position: 30 percent;
		add: #table;
		add: #detail;
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
HRBFolderContentPresenter >> detail [

	^detail ifNil: [ detail := (self instantiate: HRBFileDetailPresenter) ]
]

{ #category : #accessing }
HRBFolderContentPresenter >> folder [
	^ folder
]

{ #category : #accessing }
HRBFolderContentPresenter >> folder: anObject [
	folder := anObject.
	detail showFile: nil.
   self table items: folder allElements
	
]

{ #category : #initialization }
HRBFolderContentPresenter >> initializeWidgets [
	self detail.
	self table	
		beMultipleSelection; 
		addColumn: (SpCompositeTableColumn new
				title: 'File Name';
				addColumn:
					(SpImageTableColumn new
						width: 20;
						evaluated: #icon;
						yourself);
				addColumn:
					(SpStringTableColumn new
						evaluated: [:each | ' ',each label];
						yourself);
				yourself);		
		addColumn: (SpStringTableColumn title: 'Size' evaluated: #size)
]

{ #category : #accessing }
HRBFolderContentPresenter >> table [

	^table ifNil: [ table := self newTable ]
]

{ #category : #'api-events' }
HRBFolderContentPresenter >> whenItemsChangedDo: aBlock [
	
	table whenSelectionChangedDo: [:sel | 
		|items|
		items := sel selectedItems.
		aBlock cull: items.
			detail showFile: (items ifEmpty: [ nil ] ifNotEmpty: [ items last ])
	] 
]
