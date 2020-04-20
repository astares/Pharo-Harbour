"
Present file details
"
Class {
	#name : #HRBFileDetailPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'notebook',
		'selectedFile',
		'page'
	],
	#category : #'Harbour-UI-Components'
}

{ #category : #specs }
HRBFileDetailPresenter class >> defaultSpec [

	^ SpBoxLayout newHorizontal	 
		add: #notebook;
		yourself
]

{ #category : #specs }
HRBFileDetailPresenter class >> open [ 
	<script>
	(self new)
		openWithSpec 
]

{ #category : #initialization }
HRBFileDetailPresenter >> detailText [

	^self newText
		text: self fileContents;
		yourself
]

{ #category : #initialization }
HRBFileDetailPresenter >> fileContents [ 

	^selectedFile asFileReference binaryReadStreamDo: [:stream |
		(ZnCharacterReadStream on: stream encoding: #null) next: 5000 ]
]

{ #category : #initialization }
HRBFileDetailPresenter >> fileContentsPage [
	^ SpNotebookPage
		title: 'Preview ' , selectedFile label 
		icon: HRBIconCache fileIcon
		provider: self detailText 
		 
]

{ #category : #accessing }
HRBFileDetailPresenter >> hidePage [

	page ifNotNil: [ 
			notebook removePage: page.
			page := nil ]
]

{ #category : #initialization }
HRBFileDetailPresenter >> initializePresenters [
	
	notebook := self newNotebook
	
]

{ #category : #accessing }
HRBFileDetailPresenter >> selectedFile [
	^ selectedFile
]

{ #category : #accessing }
HRBFileDetailPresenter >> selectedFile: anObject [
	selectedFile := anObject
]

{ #category : #accessing }
HRBFileDetailPresenter >> showFile: anObject [
	self hidePage.
	selectedFile := anObject.		
	anObject isNil ifTrue: [ ^self ].		
	anObject isFile ifFalse: [ ^self ]. 
	
	page := self fileContentsPage.
	notebook addPage: page.
	notebook selectPage: page.

			
]
