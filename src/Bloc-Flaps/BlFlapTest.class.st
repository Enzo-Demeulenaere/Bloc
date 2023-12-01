Class {
	#name : #BlFlapTest,
	#superclass : #TestCase,
	#category : #'Bloc-Flaps-Tests'
}

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
	self deny: flap isOpen.
	self assert: flap openPercentage equals: 20
]
