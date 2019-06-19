Class {
	#name : #HRBFileDetailPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'notebook',
		'selectedFile'
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

	selectedFile ifNil: [ ^self newEmpty ].
	
]

{ #category : #initialization }
HRBFileDetailPresenter >> initializeWidgets [
	
	notebook := self newNotebook.
	
	notebook
		addPage: self objectInspectorPage
]

{ #category : #initialization }
HRBFileDetailPresenter >> newEmpty [ 
	^ (self instantiate: LabelPresenter) label: '(No file selected)'
]

{ #category : #initialization }
HRBFileDetailPresenter >> objectInspectorPage [
	^ NotebookPage
		title: 'File Contents'
		icon: (self iconNamed: #nautilusIcon)
		provider: [ self detailText ]
		 
]
