Class {
	#name : #BlVerticalFlapTest,
	#superclass : #TestCase,
	#category : #'Bloc-Flaps-Tests'
}

{ #category : #tests }
BlVerticalFlapTest >> testConstraintsCorrectlyInitialized [

	| flap |
	flap := BlVerticalFlap new.
	self
		assert: flap constraints horizontal resizer class
		equals: BlLayoutMatchParentResizer.
	self
		assert: flap constraints vertical resizer class
		equals: BlLayoutFitContentResizer
]

{ #category : #tests }
BlVerticalFlapTest >> testContainerCorrectlyInitialized [

	| flap |
	flap := BlVerticalFlap new.
	self
		assert: flap container class
		equals: BlVerticalThumbnailContainer
]

{ #category : #tests }
BlVerticalFlapTest >> testDefaultVerticalIsAttachedToTopEdge [

	| flap |
	flap := BlVerticalFlap new.
	self assert: flap class equals: BlVerticalFlap.
	self assert: flap edge equals: #top
]

{ #category : #tests }
BlVerticalFlapTest >> testLayoutCorrectlyInitialized [ 

	|flap|
	flap := BlVerticalFlap new.
	self assert: flap layout orientation class equals: BlLinearLayoutVerticalOrientation 
]
