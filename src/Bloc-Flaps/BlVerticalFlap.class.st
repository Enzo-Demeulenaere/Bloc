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

{ #category : 'examples' }
BlVerticalFlap class >> exampleWithDifferentName [

	<script>
	self new name: 'different name'; openInSpace
]

{ #category : 'instance creation' }
BlVerticalFlap class >> new [ 

	^ self basicNew initialize
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
	self container height: (tempPos y beBetween: 50 and: spaceExtent y - 100).
	"Here 50 and 100 represent a minimum top and bottom margin
	
	self position: aPosition x @ self position y
	redefining the position doesn't work as the AlignCenter constraint overwrites the position.
	Use another alignment constraint of delete somehow the current constraint"
	newX := tempPos x.
	newX := newX beBetween: 0 and: spaceExtent x - self handle width.

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
	handle constraintsDo: [ :c | c linear horizontal alignCenter ].
	self addChild: handle
]

{ #category : 'initialization' }
BlVerticalFlap >> initializeLayout [

	self layout: BlLinearLayout vertical
]
