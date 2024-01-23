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

	aBlSpace root addChild: self.
	self updateSize.
	
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

	^ #left
]

{ #category : #'as yet unclassified' }
BlFlap >> defaultOpenPercentage [

	^ 0.1
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
	open := true.
	openPercentage := self defaultOpenPercentage.
	self initializeConstraints.
	self initializeLayout.
	self initializeContainer.
	self initializeHandle
]

{ #category : #'as yet unclassified' }
BlFlap >> initializeConstraints [ 
	
	self constraintsDo: [ :c |
		c vertical matchParent.
		c horizontal fitContent ].
]

{ #category : #initialization }
BlFlap >> initializeContainer [

	container := BlHorizontalThumbnailContainer new flap: self.
	self addChild: container
]

{ #category : #'as yet unclassified' }
BlFlap >> initializeHandle [

	handle := BlHorizontalFlapHandle new flap: self.
	handle constraintsDo: [ :c | c linear vertical alignCenter ].
	self addChild: handle
]

{ #category : #initialization }
BlFlap >> initializeLayout [ 

	self layout: BlLinearLayout horizontal
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

{ #category : #'as yet unclassified' }
BlFlap >> updateSize [ 

	self container width: self space width * self openPercentage
]
