# Pharo-Harbour

A simple file browser experiment for Pharo written by T. Bergmann (Astares) in 2019.

# Quick Start
## Installation

```Smalltalk
Metacello new 
	repository: 'github://astares/Pharo-Harbour/src';
	baseline: 'Harbour';
	load
```

Note: only works in Pharo 8 and you need to patch 

```
recalculateVerticalScrollBar
	| interval delta pageDelta visibleRows numberOfRows |
	
	self hasDataSource ifFalse: [ ^ self ].

	self recalculateVerticalScrollBarVisibilityIfHidden: [ ^ self ].
	 
	visibleRows := self container calculateExactVisibleRows.	
	numberOfRows := self dataSource numberOfRows.
	numberOfRows = 0 ifTrue: [ ^self ].
	interval := (visibleRows / numberOfRows) asFloat.
	delta := 1/numberOfRows.
	pageDelta := ((visibleRows-1) floor)*delta.
	self verticalScrollBar 
		scrollDelta: delta pageDelta: pageDelta;
		interval: interval
```
because there is a ZeroDivide in FTTableMorph. Will provide a fix in base Pharo

## Screnshot

### Windows
![alt text](doc/screenshot-win.png "Screenshot")

### Ubuntu
![alt text](doc/screenshot-ubuntu.png "Screenshot")
