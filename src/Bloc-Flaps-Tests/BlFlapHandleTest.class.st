Class {
	#name : #BlFlapHandleTest,
	#superclass : #TestCase,
	#category : #'Bloc-Flaps-Tests'
}

{ #category : #tests }
BlFlapHandleTest >> testFlapHandleCorrectlyInitialized [

	| handle |
	handle := BlFlapHandle new.
	self assert: handle class equals: BlFlapHandle.
	self assert: handle flap isNil.
	self assert: handle background equals: Color veryLightGray asBlBackground.
	self assert: handle label text asString equals: 'New Flap'
]

{ #category : #tests }
BlFlapHandleTest >> testFlapHandleCorrectlyInitializedWithFlap [

	| flap handle |
	flap := BlFlap new.
	handle := flap handle.
	self assert: handle class equals: BlFlapHandle.
	self assert: handle flap equals: flap
]
