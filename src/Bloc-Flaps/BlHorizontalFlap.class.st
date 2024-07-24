Class {
	#name : 'BlHorizontalFlap',
	#superclass : 'BlFlap',
	#category : 'Bloc-Flaps',
	#package : 'Bloc-Flaps'
}

{ #category : 'examples' }
BlHorizontalFlap class >> example [ 

	<script>
	self new openInSpace
]

{ #category : 'as yet unclassified' }
BlHorizontalFlap >> defaultEdge [

	^ #left
]

{ #category : 'as yet unclassified' }
BlHorizontalFlap >> dragTo: aPosition [ 

| spaceExtent newY tempPos |
	self isOpen ifFalse: [ self open ].
	tempPos := aPosition.
	spaceExtent := self space extent.
	self container width: (tempPos x < 50
			 ifTrue: [ 50 ]
			 ifFalse: [ tempPos x min: spaceExtent x - 100 ]).
	"self position: self position x @ aPosition y
	
	redefining the position doesn't work as the AlignCenter constraint overwrites the position.
	Use another alignment constraint of delete somehow the current constraint"
	newY := tempPos y.
	newY := newY < 0
		        ifTrue: [ 0 ]
		        ifFalse: [ newY min: spaceExtent y - self handle height ].
	self handle constraintsDo: [ :c |
		c linear vertical alignment:
			(BlVerticalCoordinateTopAlignment new coordinate:
				 newY / spaceExtent y) ]
]

{ #category : 'as yet unclassified' }
BlHorizontalFlap >> initializeConstraints [ 
	
	self constraintsDo: [ :c |
		c vertical matchParent.
		c horizontal fitContent ].
]

{ #category : 'initialization' }
BlHorizontalFlap >> initializeContainer [

	container := BlHorizontalThumbnailContainer new flap: self.
	self addChild: container
]

{ #category : 'as yet unclassified' }
BlHorizontalFlap >> initializeHandle [

	handle := BlHorizontalFlapHandle new flap: self.
	handle constraintsDo: [ :c | c linear vertical alignCenter ].
	self addChild: handle
]

{ #category : 'initialization' }
BlHorizontalFlap >> initializeLayout [ 

	self layout: BlLinearLayout horizontal
]
