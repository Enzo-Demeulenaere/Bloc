Class {
	#name : 'BlVerticalFlapHandle',
	#superclass : 'BlFlapHandle',
	#category : 'Bloc-Flaps',
	#package : 'Bloc-Flaps'
}

{ #category : 'initialization' }
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