Class {
	#name : 'BlFlap',
	#superclass : 'BlElement',
	#instVars : [
		'handle',
		'openPercentage',
		'edge',
		'open',
		'container',
		'name'
	],
	#category : 'Bloc-Flaps',
	#package : 'Bloc-Flaps'
}

{ #category : 'instance creation' }
BlFlap class >> new [ 

^ BlHorizontalFlap basicNew initialize 
]

{ #category : 'adding' }
BlFlap >> addElement: aBlElement [

	self container addElement: aBlElement 
]

{ #category : 'adding' }
BlFlap >> addToSpace: aBlSpace [

	aBlSpace root addChild: self.
	self updateSize.
	
]

{ #category : 'api - look' }
BlFlap >> background: aColor [

	self container background:
		((BlBackground paint: aColor) opacity: 0.5).
	self container border: (self container border copyWithPaint: aColor).
	self handle background: aColor
]

{ #category : 'public' }
BlFlap >> click [ 
	self isOpen ifTrue: [ self close ] ifFalse: [ self open ]
]

{ #category : 'initialize-release' }
BlFlap >> close [

	open := false.
	self container visibility: BlVisibility gone
]

{ #category : 'accessing' }
BlFlap >> container [ 
	^ container
]

{ #category : 'initialization' }
BlFlap >> defaultColor [

	^ Color lightRed
]

{ #category : 'accessing - defaults' }
BlFlap >> defaultName [ 

	^ 'New flap'
]

{ #category : 'as yet unclassified' }
BlFlap >> defaultOpenPercentage [

	^ 0.1
]

{ #category : 'accessing' }
BlFlap >> edge [
	^ edge.
]

{ #category : 'accessing' }
BlFlap >> handle [ 
	^ handle
]

{ #category : 'accessing' }
BlFlap >> handle: aBlFlapHandle [ 
	handle := aBlFlapHandle 
]

{ #category : 'initialization' }
BlFlap >> initialize [

	super initialize.
	edge := self defaultEdge.
	open := true.
	openPercentage := self defaultOpenPercentage.
	self initializeConstraints.
	self initializeLayout.
	self initializeContainer.
	self initializeHandle
]

{ #category : 'testing' }
BlFlap >> isOpen [

	^ open
]

{ #category : 'accessing' }
BlFlap >> name [ 

	^ name ifNil: [ name := self defaultName ]
]

{ #category : 'accessing' }
BlFlap >> name: aString [ 

	name := aString.
	self handle updateLabel
]

{ #category : 'accessing' }
BlFlap >> open [

	open := true.
	self container visibility: BlVisibility visible.
]

{ #category : 'accessing' }
BlFlap >> openPercentage [ 
	^ openPercentage 
]

{ #category : 'accessing' }
BlFlap >> openPercentage: aNumber [
	
	aNumber > 90 ifTrue: [ ^ self ].
	openPercentage := aNumber 
]

{ #category : 'as yet unclassified' }
BlFlap >> updateSize [ 

	self container width: self space width * self openPercentage
]
