Class {
	#name : #BlVerticalFlapHandle,
	#superclass : #BlFlapHandle,
	#category : #'Bloc-Flaps'
}

{ #category : #'as yet unclassified' }
BlVerticalFlapHandle >> drag [

	| mousePos spaceExtent newX |
	self flap isOpen ifFalse: [ self flap open ].
	mousePos := self space testMouseProcessor lastMouseMoveEvent position.
	spaceExtent := self space extent.
	self flap container height: (mousePos y < 50
			 ifTrue: [ 50 ]
			 ifFalse: [ mousePos y min: spaceExtent y - 100 ]).
	newX := mousePos x.
	newX := newX < (self width / 2)
		        ifTrue: [ self width / 2 ]
		        ifFalse: [ newX min: spaceExtent x - (self width / 2) ].
	"temporary solution because the origin is set in the middle"
	self constraintsDo: [ :c |
		c linear horizontal alignment:
			(BlHorizontalCoordinateLeftAlignment new coordinate:
				 newX / spaceExtent x) ]
]

{ #category : #'as yet unclassified' }
BlVerticalFlapHandle >> dragTo: aPosition [

	| spaceExtent newX tempPos |
	self flap isOpen ifFalse: [ self flap open ].
	tempPos := aPosition.
	spaceExtent := self space extent.
	self flap container height: (tempPos y < 50
			 ifTrue: [ 50 ]
			 ifFalse: [ tempPos y min: spaceExtent y - 100 ]).
	newX := tempPos x.
	newX := newX < 0
		        ifTrue: [ 0 ]
		        ifFalse: [ newX min: spaceExtent x - self width ].

	self constraintsDo: [ :c |
		c linear horizontal alignment:
			(BlHorizontalCoordinateLeftAlignment new coordinate:
				 newX / spaceExtent x) ]
]

{ #category : #initialization }
BlVerticalFlapHandle >> initializeGeometry [

	| topRadii bottomRadii |
	topRadii := self flap edge == #top
		            ifTrue: [ 0 ]
		            ifFalse: [ 15 ].
	bottomRadii := self flap edge == #bottom
		               ifTrue: [ 0 ]
		               ifFalse: [ 15 ].
	self geometry:
		(BlRoundedRectangleGeometry cornerRadii: (BlCornerRadii new
				  topLeft: topRadii;
				  topRight: topRadii;
				  bottomLeft: bottomRadii;
				  bottomRight: bottomRadii;
				  yourself))
]
