Class {
	#name : #BlFlap,
	#superclass : #BlElement,
	#instVars : [
		'handle',
		'openPercentage',
		'edge',
		'open'
	],
	#category : #'Bloc-Flaps'
}

{ #category : #adding }
BlFlap >> addToSpace: aBlSpace [ 
	
	aBlSpace root addChild: self
]

{ #category : #'initialize-release' }
BlFlap >> close [ 
	
	open := false
]

{ #category : #'as yet unclassified' }
BlFlap >> createHandle [ 
	
	|flapHandle|
	flapHandle := BlFlapHandle new.
	self handle: flapHandle .
	flapHandle flap: self.
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
	self createHandle
]

{ #category : #testing }
BlFlap >> isOpen [

	^ open
]

{ #category : #accessing }
BlFlap >> open [ 
	open := true
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
