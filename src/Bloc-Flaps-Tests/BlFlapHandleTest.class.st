Class {
	#name : #BlFlapHandleTest,
	#superclass : #TestCase,
	#category : #'Bloc-Flaps-Tests'
}

{ #category : #tests }
BlFlapHandleTest >> testFlapHandleCorrectlyInitialized [

	| handle |
	handle := BlHorizontalFlapHandle new.
	self assert: handle class equals: BlHorizontalFlapHandle.
	self assert: handle flap isNil.
	self
		assert: handle background
		equals: Color veryLightGray asBlBackground.
	self assert: handle defaultLabel text asString equals: 'New Flap'
]

{ #category : #tests }
BlFlapHandleTest >> testFlapHandleCorrectlyInitializedWithFlap [

	| flap handle |
	flap := BlFlap new.
	handle := flap handle.
	self assert: handle class equals: BlHorizontalFlapHandle.
	self assert: handle flap equals: flap
]
