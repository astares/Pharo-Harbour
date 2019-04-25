"
An icon cache
"
Class {
	#name : #HRBIconCache,
	#superclass : #Object,
	#classVars : [
		'IconCache'
	],
	#category : #'Harbour-Core-Utilities'
}

{ #category : #icons }
HRBIconCache class >> driveIcon [
	<script: 'self driveIcon inspect'>

	^self iconNamed: #driveIcon
]

{ #category : #'private - icons' }
HRBIconCache class >> driveIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/0lEQVQ4je2RPUoDcRDFf7tI
mjSbE5gUYhoFjSvYSI5i4QFSWHgYIQewELyFX4mF4BfqqmhlSJotdve/8yySbEwhrq34YJjH
K2bem4F//AF4U/IYvdYl9c0UmAwzw0zIZvyL3thsrUYA/myU1wWCkou7U+IDRC9vHQ/av3De
Pjm/3Cki9K9uh3c314GZTWwKyZCETOOOkAAEgqXl5mh7a6O2ADAYfATHR4ckSUKapkVlWYZz
DucceZ4Tr8VUTitIorO3H8zf4Af4LZ/wICQO43m97AC7MHq7Papn1TndA7h/fh9GTw9B8TZZ
kd007kzugEASi/XGaH2lWStr4Ft8AlWZooQwDP14AAAAAElFTkSuQmCC'
]

{ #category : #icons }
HRBIconCache class >> folderIcon [
	<script: 'self folderIcon inspect'>

	^self iconNamed: #folderIcon
]

{ #category : #'private - icons' }
HRBIconCache class >> folderIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABdElEQVR42mNkoBAwwhhdbT7Z
xvqa4b9/fmT+++sT45vXz3+XNB3qfP36/3ag9H+8BvT1xCdkJljN5WD4z8TwGyjwC6gDiDfs
OfgpumhF/Pfv/zfiMoQxNibQua0lfPvv729Z///+w/Dvzx8Gpn8MDOysrAyM//4z7D1x9dOr
D99WiYvyfv737zfDv79ANUD6z68fDMvXn9rIuGBBZ018NH8zw1+gcUCNcJogm5EhrnbyZMZ5
81prEqOFm4nXCGMzMsTWTpjMOHdOU01StFgzabZDXBBT2zeZcc6suprkGKlmkImkGhJd1z2Z
cdaM6prUGNlmkImkhkNUXcdkxpnTymvSYhSbMRQR4YXIurbJjNOnFtdkxKhiD0QCsRBR3zyZ
cdrkgprMGI1m0myHxEJ4fcNkxikTc2qyY3TJ8AIDQ1h97WRGaysdM011qeh///8w/v8HSmV/
GP7/+8sA5DOg8EH0fxD/L1z87OW3W+GZieLcSC4AAOV6G9lUA/2gAAAAAElFTkSuQmCC'
]

{ #category : #'private - accessing' }
HRBIconCache class >> iconCache [

	^ IconCache ifNil: [ IconCache := Dictionary new ]
]

{ #category : #accessing }
HRBIconCache class >> iconNamed: aSymbol [
	"Returns the icon with the given name"
	
	| selector |
	selector := (aSymbol , 'Contents') asSymbol.
	(self class canUnderstand: selector) ifFalse: [ ^super iconNamed: aSymbol ].
	^ self iconCache
		at: aSymbol
		ifAbsentPut: [ 
			Form
				fromBinaryStream: (self perform: selector) base64Decoded readStream ]
]

{ #category : #'initialization-release' }
HRBIconCache class >> reset [
	"Reset the icon cache"	
	<script>
	
	IconCache := nil
]

{ #category : #icons }
HRBIconCache class >> terminalIcon [
	<script: 'self terminalIcon inspect'>

	^self iconNamed: #terminalIcon
]

{ #category : #'private - icons' }
HRBIconCache class >> terminalIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABHklEQVR4XmOgGIiKimlo6+iF
koqVlVVcgdoZGYpKKladv3z9PxxfAuFr/8+h44vX/m/bc+T/1t2H/x84evr/yvXb/gMN4Gco
Kata5e/v/9/X1/e/t7f3f09Pz/9ubm7/nZ2d/zs4OPy3sbH5b25u/t/Q0PC/qqrqf1FR0f+M
jIz/C0sqQAYIww2YM2fO//j4+P+xsbH/16xZQ7wBxVgMiIqK+j9t2rT/WVlZ/2tra8HiSkpK
/yUlJf/z8/OjGpBTUAr3gpeX139TU9P/MjIy/7m4uEAKcOKsvGKYASVgA0xMTP5zc3Pj1YTT
AAUFBaI1YhgAZKwiVfNwM0BFVS3B1z94OxDvIAWbWVgtBBrAywDOEAwMLEDMSiJmYaAGAABP
FCjDKXmnHQAAAABJRU5ErkJggg=='
]
