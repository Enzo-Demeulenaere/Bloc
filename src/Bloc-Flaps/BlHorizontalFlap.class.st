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

{ #category : 'examples' }
BlHorizontalFlap class >> exampleWithDifferentName [

	<script>
	self new name: 'different name' ;openInSpace
]

{ #category : 'as yet unclassified' }
BlHorizontalFlap >> attachToEdgeBottom [
]

{ #category : 'as yet unclassified' }
BlHorizontalFlap >> attachToEdgeLeft [

	self initializePosition.
	self addChild: container.
	self initializeHandle 
]

{ #category : 'as yet unclassified' }
BlHorizontalFlap >> attachToEdgeRight [

	self initializePosition.
	self initializeHandle.
	self addChild: container
]

{ #category : 'as yet unclassified' }
BlHorizontalFlap >> attachToEdgeTop [

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
	self container width: (tempPos x beBetween: 50 and: spaceExtent x - 100).
	"Here 50 and 100 represent a minimum left and right margin
	
	self position: self position x @ aPosition y
	redefining the position doesn't work as the AlignCenter constraint overwrites the position.
	Use another alignment constraint of delete somehow the current constraint"
	newY := tempPos y.
	newY := newY beBetween: 0 and: spaceExtent y - self handle height.
	self handle constraintsDo: [ :c |
		c linear vertical alignment:
			(BlVerticalCoordinateTopAlignment new coordinate:
				 newY / spaceExtent y) ]
]

{ #category : 'accessing' }
BlHorizontalFlap >> edge: aSymbol [

	aSymbol = self edge ifTrue: [ ^ self ].
	({ #left. #right } includes: aSymbol) ifFalse: [
		self inform:
			'Can only attach to #left or #right edge '.
		^ self ].
	self removeChildren.
	edge := aSymbol.
	aSymbol = #left ifTrue: [ self attachToEdgeLeft ].
	aSymbol = #right ifTrue: [ self attachToEdgeRight ].
	aSymbol = #top ifTrue: [ "self attachToEdgeTop" ].
	aSymbol = #bottom ifTrue: [ "self attachToEdgeBottom" ]
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

{ #category : 'initialization' }
BlHorizontalFlap >> initializePosition [

	self constraintsDo: [ :c | self edge = #left ifTrue: [ c frame horizontal alignLeft ] ifFalse: [ c frame horizontal alignRight ] ].
	"self edge = #left
		ifTrue: [ self constraintsDo: [ :c | c frame horizontal alignLeft ] ]
		ifFalse: [
		self constraintsDo: [ :c | c frame horizontal alignRight ] ]"
]
