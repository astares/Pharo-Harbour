"
Present file details
"
Class {
	#name : #HRBFileDetailPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'notebook',
		'selectedFile',
		'page'
	],
	#category : #'Harbour-UI-Components'
}

{ #category : #specs }
HRBFileDetailPresenter class >> defaultSpec [

	^ SpecBoxLayout newHorizontal	 
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
		text: 'test';
		yourself
]

{ #category : #initialization }
HRBFileDetailPresenter >> fileContentsPage [
	^ NotebookPage
		title: 'File Contents'
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
HRBFileDetailPresenter >> initializeWidgets [
	
	notebook := self newNotebook.
	
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
	anObject isFile ifTrue: [  
			selectedFile := anObject.		
			page := self fileContentsPage.
			notebook addPage: page.
			notebook selectPage: page.
	]
			
]
