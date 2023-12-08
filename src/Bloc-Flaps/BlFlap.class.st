Class {
	#name : #BlFlap,
	#superclass : #BlElement,
	#instVars : [
		'handle',
		'openPercentage',
		'edge',
		'open',
		'container'
	],
	#category : #'Bloc-Flaps'
}

{ #category : #adding }
BlFlap >> addToSpace: aBlSpace [ 
	
	aBlSpace root addChild: self
]

{ #category : #'api - look' }
BlFlap >> background: aColor [

	self container background:
		((BlBackground paint: aColor) opacity: 0.5).
	self container border: (self container border copyWithPaint: aColor).
	self handle background: aColor
]

{ #category : #public }
BlFlap >> click [ 
	self isOpen ifTrue: [ self close ] ifFalse: [ self open ]
]

{ #category : #'initialize-release' }
BlFlap >> close [

	open := false.
	self container visibility: BlVisibility gone
]

{ #category : #accessing }
BlFlap >> container [ 
	^ container
]

{ #category : #initialization }
BlFlap >> defaultColor [

	^ Color lightRed
]

{ #category : #'as yet unclassified' }
BlFlap >> defaultEdge [ 
	^ #right
]

{ #category : #'as yet unclassified' }
BlFlap >> defaultOpenPercentage [ 
		
	^ 20
]

{ #category : #accessing }
BlFlap >> edge [
	^ edge.
]

{ #category : #accessing }
BlFlap >> handle [ 
	^ handle
]

{ #category : #accessing }
BlFlap >> handle: aBlFlapHandle [ 
	handle := aBlFlapHandle 
]

{ #category : #initialization }
BlFlap >> initialize [

	super initialize.
	edge := self defaultEdge.
	open := false.
	openPercentage := self defaultOpenPercentage.
	self constraintsDo: [ :c |
		c vertical matchParent.
		c horizontal fitContent ].
	self layout: BlLinearLayout horizontal.
	self initializeContainer.
	self initializeHandle.
	
]

{ #category : #initialization }
BlFlap >> initializeContainer [

	container := BlThumbnailContainer new flap: self.
	self addChild: container
]

{ #category : #'as yet unclassified' }
BlFlap >> initializeHandle [

	handle := BlFlapHandle new flap: self.
	self addChild: self handle.
]

{ #category : #testing }
BlFlap >> isOpen [

	^ open
]

{ #category : #accessing }
BlFlap >> open [

	open := true.
	self container visibility: BlVisibility visible.
]

{ #category : #accessing }
BlFlap >> openPercentage [ 
	^ openPercentage 
]

{ #category : #accessing }
BlFlap >> openPercentage: aNumber [
	
	aNumber > 90 ifTrue: [ ^ self ].
	openPercentage := aNumber 
]
