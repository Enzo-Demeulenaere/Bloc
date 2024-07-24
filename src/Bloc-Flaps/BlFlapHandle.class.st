Class {
	#name : 'BlFlapHandle',
	#superclass : 'BlElement',
	#instVars : [
		'flap',
		'label'
	],
	#category : 'Bloc-Flaps',
	#package : 'Bloc-Flaps'
}

{ #category : 'as yet unclassified' }
BlFlapHandle class >> createWithLabel: aString [

	^ self new label: (BlTextElement text: aString asRopedText)
]

{ #category : 'initialization' }
BlFlapHandle >> defaultBackground [ 
	
	^ Color veryLightGray 
]

{ #category : 'as yet unclassified' }
BlFlapHandle >> dragTo: aPosition [

	self flap dragTo: aPosition.
]

{ #category : 'accessing' }
BlFlapHandle >> flap [
	^ flap
]

{ #category : 'accessing' }
BlFlapHandle >> flap: aBlFlap [

	flap := aBlFlap.
	self background: aBlFlap defaultColor.
	self initializeGeometry.
	self initializeLabel
]

{ #category : 'initialization' }
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

{ #category : 'initialization' }
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
		offset := event position - self position. ].

	self addEventHandlerOn: BlDragEvent do: [ :event |
		self dragTo: event position - offset ]
]

{ #category : 'initialization' }
BlFlapHandle >> initializeLabel [

	label := self defaultLabel.
	self addChild: label
]

{ #category : 'accessing' }
BlFlapHandle >> label [ 
	^ label
]

{ #category : 'accessing' }
BlFlapHandle >> label: aTextElement [

	label := aTextElement 
]

{ #category : 'events' }
BlFlapHandle >> primaryClick [
	
	self flap click

	
]

{ #category : 'transformations' }
BlFlapHandle >> rotateBy: anAngle [ 
		
	self transform rotateBy: anAngle; apply
]

{ #category : 'steps - interactions' }
BlFlapHandle >> secondaryClick [ 

	self inform: 'TODO: Context Menu'
]
