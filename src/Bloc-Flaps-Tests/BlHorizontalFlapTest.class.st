Class {
	#name : #BlHorizontalFlapTest,
	#superclass : #TestCase,
	#category : #'Bloc-Flaps-Tests'
}

{ #category : #tests }
BlHorizontalFlapTest >> testConstraintsCorrectlyInitialized [

	| flap |
	flap := BlHorizontalFlap new.
	self
		assert: flap constraints vertical resizer class
		equals: BlLayoutMatchParentResizer.
	self assert: flap constraints horizontal resizer class equals: BlLayoutFitContentResizer 
]

{ #category : #tests }
BlHorizontalFlapTest >> testContainerCorrectlyInitialized [

	| flap |
	flap := BlHorizontalFlap new.
	self
		assert: flap container class
		equals: BlHorizontalThumbnailContainer
]

{ #category : #tests }
BlHorizontalFlapTest >> testDefaultHorizontalIsAttachedToLeftEdge [

	| flap |
	flap := BlHorizontalFlap new.
	self assert: flap class equals: BlHorizontalFlap.
	self assert: flap edge equals: #left
]

{ #category : #tests }
BlHorizontalFlapTest >> testLayoutCorrectlyInitialized [

	| flap |
	flap := BlHorizontalFlap new.
	self
		assert: flap layout orientation class
		equals: BlLinearLayoutHorizontalOrientation
]
