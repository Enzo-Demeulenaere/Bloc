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

	| lab textSize |
	lab := BlTextElement text: ('New Flap' asRopedText
			        fontSize: 15;
			        yourself).
	lab forceLayout.
	textSize := lab size.

	lab transformDo: [ :t |
		t translateBy: 0 @ textSize y negated.
		t topLeftOrigin.
		t rotateBy: 90 ].
	lab size: lab transformedBounds extent.
	^ lab
]

{ #category : #accessing }
BlFlapHandle >> flap [
	^ flap
]

{ #category : #accessing }
BlFlapHandle >> flap: aBlFlap [

	flap := aBlFlap.
	self background: aBlFlap defaultColor.
]

{ #category : #initialization }
BlFlapHandle >> initialize [

	super initialize.
	self layout: BlFrameLayout new.
	self constraintsDo: [ :c |
		c vertical fitContent.
		c horizontal fitContent.
		c linear vertical alignCenter ].
	self padding: (BlInsets all: 10).
	self background: self defaultBackground.
	self geometry:
		(BlRoundedRectangleGeometry cornerRadii: (BlCornerRadii new
				  topLeft: 0;
				  topRight: 15;
				  bottomLeft: 0;
				  bottomRight: 15;
				  yourself)).
	self label: self defaultLabel.
	self addChild: self label.
	self initializeEvents 
]

{ #category : #initialization }
BlFlapHandle >> initializeEvents [

	self addEventHandlerOn: BlClickEvent do: [ :e |
		e button
			ifPrimary: [ self primaryClick ]
			secondary: [ self secondaryClick ]
			middle: [ ^ self ]
			other: [ ^ self ] ]
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

{ #category : #events }
BlFlapHandle >> secondaryClick [

	self flap openPercentage: (0.1 to: 0.9 by: 0.05) atRandom.
	self flap updateSize
]
