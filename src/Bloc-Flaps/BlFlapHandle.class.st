Class {
	#name : #BlFlapHandle,
	#superclass : #BlElement,
	#instVars : [
		'flap',
		'label'
	],
	#category : #'Bloc-Flaps'
}

{ #category : #'as yet unclassified' }
BlFlapHandle class >> createWithLabel: aString [

	^ self new label: (BlTextElement text: aString asRopedText)
]

{ #category : #initialization }
BlFlapHandle >> defaultBackground [ 
	
	^ Color veryLightGray 
]

{ #category : #accessing }
BlFlapHandle >> defaultLabel [

	| lab |
	lab := BlTextElement text: ('New Flap' asRopedText
			        fontSize: 15;
			        yourself).
	lab forceLayout.
	
	^ lab
]

{ #category : #'as yet unclassified' }
BlFlapHandle >> dragTo: aPosition [

	| spaceExtent newY tempPos |
	self flap isOpen ifFalse: [ self flap open ].
	tempPos := aPosition.
	spaceExtent := self space extent.
	self flap container width: (tempPos x < 50
			 ifTrue: [ 50 ]
			 ifFalse: [ tempPos x min: spaceExtent x - 100 ]).
	"self position: self position x @ aPosition y
	
	redefining the position doesn't work as the AlignCenter constraint overwrites the position.
	Use another alignment constraint of delete somehow the current constraint"
	newY := tempPos y.
	newY := newY < 0
		        ifTrue: [ 0 ]
		        ifFalse: [ newY min: spaceExtent y - self height ].
	self constraintsDo: [ :c |
		c linear vertical alignment:
			(BlVerticalCoordinateTopAlignment new coordinate:
				 newY / spaceExtent y) ]
]

{ #category : #accessing }
BlFlapHandle >> flap [
	^ flap
]

{ #category : #accessing }
BlFlapHandle >> flap: aBlFlap [

	flap := aBlFlap.
	self background: aBlFlap defaultColor.
	self initializeGeometry.
	self initializeLabel
]

{ #category : #initialization }
BlFlapHandle >> initialize [

	super initialize.
	self layout: BlFrameLayout new.
	self constraintsDo: [ :c |
		c vertical fitContent.
		c horizontal fitContent ].
	self padding: (BlInsets all: 10).
	self background: self defaultBackground.
	self initializeEvents.
	"self addChild: (BlElement new
			 background: Color red;
			 size: 5 @ 5;
			 yourself)"
	"self addEventHandler: (BlPullHandler new
			 disallowOutOfBounds;
			 yourself)"
]

{ #category : #initialization }
BlFlapHandle >> initializeEvents [

	| offset |
	self addEventHandlerOn: BlClickEvent do: [ :e |
		e button
			ifPrimary: [ self primaryClick ]
			secondary: [ self secondaryClick ]
			middle: [ ^ self ]
			other: [ ^ self ] ].
	self addEventHandlerOn: BlDragStartEvent do: [ :event |
		event consumed: true.
		offset := event position - self position.
		"'event :' traceCr.
		event position traceCr.
		'handle pos :' traceCr.
		self position traceCr.
		'offset :' traceCr.
		offset traceCr.
		'bounds :' traceCr.
		self bounds traceCr" ].

	self addEventHandlerOn: BlDragEvent do: [ :event |
		self dragTo: event position - offset
		"'event :' traceCr.
		event position traceCr.
		'handle pos :' traceCr.
		self position traceCr.
		'offset :' traceCr.
		offset traceCr.
		'bounds :' traceCr.
		self bounds traceCr" ]
]

{ #category : #initialization }
BlFlapHandle >> initializeGeometry [

	| leftRadii rightRadii |
	leftRadii := (self flap edge == #left)
		             ifTrue: [ 0 ]
		             ifFalse: [ 15 ].
	rightRadii := (self flap edge == #right)
		              ifTrue: [ 15 ]
		              ifFalse: [ 0 ].
	self geometry:
		(BlRoundedRectangleGeometry cornerRadii: (BlCornerRadii new
				  topLeft: leftRadii;
				  topRight: rightRadii;
				  bottomLeft: leftRadii;
				  bottomRight: rightRadii;
				  yourself))
]

{ #category : #initialization }
BlFlapHandle >> initializeLabel [

	label := self defaultLabel.
	self addChild: label
]

{ #category : #accessing }
BlFlapHandle >> label [ 
	^ label
]

{ #category : #accessing }
BlFlapHandle >> label: aTextElement [

	label := aTextElement 
]

{ #category : #events }
BlFlapHandle >> primaryClick [
	
	self flap click

	
]

{ #category : #transformations }
BlFlapHandle >> rotateBy: anAngle [ 
		
	self transform rotateBy: anAngle; apply
]

{ #category : #'steps - interactions' }
BlFlapHandle >> secondaryClick [ 

	self inform: 'TODO: Context Menu'
]
