Class {
	#name : 'BlFlap',
	#superclass : 'BlElement',
	#instVars : [
		'handle',
		'openPercentage',
		'edge',
		'open',
		'container',
		'name',
		'backgroundColor'
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
BlFlap >> addElements: aCollection [

	self container addElements: aCollection 
]

{ #category : 'adding' }
BlFlap >> addToSpace: aBlSpace [

	aBlSpace root layout class = BlFrameLayout ifFalse: [ aBlSpace root layout: BlFrameLayout new].
	aBlSpace root addChild: self.
	
]

{ #category : 'api - look' }
BlFlap >> background: aColor [

	self backgroundColor: aColor. 
	self container background:
		((BlBackground paint: aColor) opacity: 0.5).
	self container border: (self container border copyWithPaint: aColor).
	self handle background: aColor
]

{ #category : 'accessing' }
BlFlap >> backgroundColor [

	^ backgroundColor
]

{ #category : 'accessing' }
BlFlap >> backgroundColor: aColor [ 

	backgroundColor := aColor 
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

{ #category : 'as yet unclassified' }
BlFlap >> defaultEdge [ 

	self subclassResponsibility 
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

{ #category : 'tests - printing' }
BlFlap >> elements [

	^ container elements
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
	backgroundColor := self defaultColor.
	open := true.
	openPercentage := self defaultOpenPercentage.
	self initializePosition.
	self initializeConstraints.
	self initializeLayout.
	self initializeContainer.
	self initializeHandle.
	self preventMouseEvents 
]

{ #category : 'initialization' }
BlFlap >> initializeConstraints [

	self subclassResponsibility
]

{ #category : 'initialization' }
BlFlap >> initializeContainer [

	self subclassResponsibility
]

{ #category : 'initialization' }
BlFlap >> initializeHandle [

	self subclassResponsibility
]

{ #category : 'initialization' }
BlFlap >> initializeLayout [

	self subclassResponsibility
]

{ #category : 'initialization' }
BlFlap >> initializePosition [ 

	self subclassResponsibility 
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
