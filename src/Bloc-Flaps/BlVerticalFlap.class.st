Class {
	#name : #BlVerticalFlap,
	#superclass : #BlFlap,
	#category : #'Bloc-Flaps'
}

{ #category : #'as yet unclassified' }
BlVerticalFlap >> defaultEdge [ 

	^ #top
]

{ #category : #'as yet unclassified' }
BlVerticalFlap >> initializeConstraints [

	self constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ]
]

{ #category : #initialization }
BlVerticalFlap >> initializeContainer [

	container := BlVerticalThumbnailContainer new flap: self.
	self addChild: container
]

{ #category : #'as yet unclassified' }
BlVerticalFlap >> initializeHandle [

	handle := BlVerticalFlapHandle new flap: self.
	"	newX := self space width/
	handle position: "
	handle constraintsDo: [ :c | c linear horizontal alignCenter ].
	self addChild: handle
]

{ #category : #initialization }
BlVerticalFlap >> initializeLayout [

	self layout: BlLinearLayout vertical
]
