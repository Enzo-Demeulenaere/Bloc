Class {
	#name : #BlFlapTest,
	#superclass : #BlParameterizedHostTest,
	#category : #'Bloc-Flaps-Tests'
}

{ #category : #tests }
BlFlapTest class >> exampleContainerAndHandleAligned [

	<script>
	self new exampleContainerAndHandleAligned openInSpace
]

{ #category : #tests }
BlFlapTest >> exampleContainerAndHandleAligned [

	<demo>
	| parent elt1 elt2 |
	parent := BlElement new
		          layout: BlLinearLayout horizontal;
		          border: (BlBorder builder
				           dashed;
				           paint: Color red;
				           width: 3;
				           build).

	elt1 := BlElement new
		        size: 50 @ 100;
		        background: Color lightBlue.
	elt2 := BlElement new
		        size: 200 @ 200;
		        background: Color lightGreen.

	elt1 constraintsDo: [ :c | c linear vertical alignCenter ].
	elt2 constraintsDo: [ :c |
		c linear horizontal alignLeft.
		c vertical matchParent ].

	parent constraintsDo: [ :c |
		c vertical matchParent.
		c horizontal fitContent ].
	parent addChildren: {
			elt2.
			elt1 }.
	elt2 visibility: BlVisibility visible.
	"=> easy implementation : just have to change visibility from visible to gone"


	parent padding: (BlInsets all: 5).
	^ parent
]

{ #category : #tests }
BlFlapTest >> testClickOnHandleToCloseAndOpenAgain [

	| flap |
	flap := BlFlap new.

	self assert: flap isOpen.
	self assert: flap container visibility equals: BlVisibility visible.
	BlSpace simulateClickOn: flap handle.
	self deny: flap isOpen.
	self assert: flap container visibility equals: BlVisibility gone.
	BlSpace simulateClickOn: flap handle.
	self assert: flap isOpen.
	self assert: flap container visibility equals: BlVisibility visible.
]

{ #category : #tests }
BlFlapTest >> testDragChangesHandlePosition [

	| flap space handlePosition |
	space := self newTestingSpace.
	flap := BlHorizontalFlap new addToSpace: space.
	self waitTestingSpaces.
	handlePosition := flap handle position.

	self assert: flap isOpen.
	BlSpace simulateDragOn: flap handle by: (BlVector x: 20 y: 30).
	self assert: flap isOpen.
	self waitTestingSpaces.
	self assert: flap handle position equals: handlePosition + (20 @ 30)
]

{ #category : #tests }
BlFlapTest >> testDragChangesHandlePositionHorizontal [

	| flap space handlePosition |
	space := self newTestingSpace.
	flap := BlHorizontalFlap new addToSpace: space.
	self waitTestingSpaces.
	handlePosition := flap handle position.

	self assert: flap isOpen.
	BlSpace simulateDragOn: flap handle by: (BlVector x: 20 y: 30).
	self assert: flap isOpen.
	self waitTestingSpaces.
	self assert: flap handle position equals: handlePosition + (20 @ 30)
]

{ #category : #tests }
BlFlapTest >> testDragChangesHandlePositionVertical [

	| flap space handlePosition |
	space := self newTestingSpace.
	flap := BlVerticalFlap new addToSpace: space.
	self waitTestingSpaces.
	handlePosition := flap handle position.

	self assert: flap isOpen.
	BlSpace simulateDragOn: flap handle by: (BlVector x: 20 y: 30).
	self assert: flap isOpen.
	self waitTestingSpaces.
	self assert: flap handle position equals: handlePosition + (20 @ 30)
]

{ #category : #tests }
BlFlapTest >> testFlapAddedInASpace [

	| flap space |
	space := BlSpace new extent: 500 @ 500.

	flap := BlFlap new addToSpace: space.

	self assert: flap parent equals: space root
]

{ #category : #tests }
BlFlapTest >> testFlapCorrectlyInitialized [

	| flap |
	flap := BlFlap new.

	self assert: flap class equals: BlFlap.
	self assert: flap handle class equals: BlHorizontalFlapHandle.
	self assert: flap container class equals: BlHorizontalThumbnailContainer.
	self assert: flap isOpen.
	self assert: flap openPercentage equals: 0.1
]
