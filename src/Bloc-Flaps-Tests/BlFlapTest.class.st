Class {
	#name : #BlFlapTest,
	#superclass : #TestCase,
	#category : #'Bloc-Flaps-Tests'
}

{ #category : #tests }
BlFlapTest >> testExampleContainerAndHandleAligned [

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

	elt1 constraintsDo: [ :c |
		c linear vertical alignCenter ].
	elt2 constraintsDo: [ :c | c linear horizontal alignLeft. c vertical matchParent ].

	parent constraintsDo: [ :c |
		c vertical matchParent.
		c horizontal fitContent ].
	parent addChildren: {
			elt2.
			elt1 }.
	elt2 visibility: BlVisibility visible.
	"=> easy implementation : just have to change visibility from visible to gone"


	parent padding: (BlInsets all: 5).
	parent openInSpace
]

{ #category : #tests }
BlFlapTest >> testFlapAddedOnTheRightOfASpace [

	| flap space |
	space := BlSpace new extent: 500 @ 500.

	flap := BlFlap new addToSpace: space.

	self assert: flap edge equals: #right.
	self assert: flap parent equals: space root.
]

{ #category : #tests }
BlFlapTest >> testFlapCorrectlyInitialized [

	| flap |
	flap := BlFlap new.

	self assert: flap class equals: BlFlap.
	self assert: flap edge equals: #right.
	self assert: flap handle class equals: BlFlapHandle.
	self assert: flap container class equals: BlThumbnailContainer.
	self deny: flap isOpen.
	self assert: flap openPercentage equals: 20
]
