Class {
	#name : 'BlVerticalFlap',
	#superclass : 'BlFlap',
	#category : 'Bloc-Flaps',
	#package : 'Bloc-Flaps'
}

{ #category : 'examples' }
BlVerticalFlap class >> example [ 

	<script>
	self new openInSpace
]

{ #category : 'as yet unclassified' }
BlVerticalFlap >> defaultEdge [ 

	^ #top
]

{ #category : 'as yet unclassified' }
BlVerticalFlap >> dragTo: aPosition [

	| spaceExtent newX tempPos |
	self isOpen ifFalse: [ self open ].
	tempPos := aPosition.
	spaceExtent := self space extent.
	self container height: (tempPos y < 50
			 ifTrue: [ 50 ]
			 ifFalse: [ tempPos y min: spaceExtent y - 100 ]).
	newX := tempPos x.
	newX := newX < 0
		        ifTrue: [ 0 ]
		        ifFalse: [ newX min: spaceExtent x - self handle width ].

	self handle constraintsDo: [ :c |
		c linear horizontal alignment:
			(BlHorizontalCoordinateLeftAlignment new coordinate:
				 newX / spaceExtent x) ]
]

{ #category : 'as yet unclassified' }
BlVerticalFlap >> initializeConstraints [

	self constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ]
]

{ #category : 'initialization' }
BlVerticalFlap >> initializeContainer [

	container := BlVerticalThumbnailContainer new flap: self.
	self addChild: container
]

{ #category : 'as yet unclassified' }
BlVerticalFlap >> initializeHandle [

	handle := BlVerticalFlapHandle new flap: self.
	"	newX := self space width/
	handle position: "
	handle constraintsDo: [ :c | c linear horizontal alignCenter ].
	self addChild: handle
]

{ #category : 'initialization' }
BlVerticalFlap >> initializeLayout [

	self layout: BlLinearLayout vertical
]
