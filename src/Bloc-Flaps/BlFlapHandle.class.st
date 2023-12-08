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

	^ BlTextElement text: 'New Flap' asRopedText 
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
	self label: self defaultLabel.
	self addChild: self label.
	self addEventHandlerOn: BlClickEvent do: [ self flap click ]
]

{ #category : #accessing }
BlFlapHandle >> label [ 
	^ label
]

{ #category : #accessing }
BlFlapHandle >> label: aTextElement [

	label := aTextElement 
]

{ #category : #transformations }
BlFlapHandle >> rotateBy: anAngle [ 
		
	self transform rotateBy: anAngle; apply
]
