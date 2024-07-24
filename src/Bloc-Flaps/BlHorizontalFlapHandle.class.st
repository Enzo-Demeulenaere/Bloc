Class {
	#name : 'BlHorizontalFlapHandle',
	#superclass : 'BlFlapHandle',
	#category : 'Bloc-Flaps',
	#package : 'Bloc-Flaps'
}

{ #category : 'accessing' }
BlHorizontalFlapHandle >> defaultLabel [

	| lab textSize |
	lab := super defaultLabel.
	textSize := lab size.

	lab transformDo: [ :t |
		t translateBy: 0 @ textSize y negated.
		t topLeftOrigin.
		t rotateBy: 90.].
	lab size: lab transformedBounds extent.
	^ lab
]

{ #category : 'initialization' }
BlHorizontalFlapHandle >> initializeGeometry [

	| leftRadii rightRadii |
	leftRadii := self flap edge == #left
		             ifTrue: [ 0 ]
		             ifFalse: [ 15 ].
	rightRadii := self flap edge == #right
		              ifTrue: [ 0 ]
		              ifFalse: [ 15 ].
	self geometry:
		(BlRoundedRectangleGeometry cornerRadii: (BlCornerRadii new
				  topLeft: leftRadii;
				  topRight: rightRadii;
				  bottomLeft: leftRadii;
				  bottomRight: rightRadii;
				  yourself))
]
