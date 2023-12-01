Class {
	#name : #BlFlapHandleTest,
	#superclass : #TestCase,
	#category : #'Bloc-Thumbnail-Tests'
}

{ #category : #tests }
BlFlapHandleTest >> testFlapHandleCorrectlyInitialized [ 
		
	|flap handle| 
	
	flap := BlFlap new.
	handle := flap handle.
	self assert: handle class equals: BlFlapHandle.
	self assert: handle flap equals: flap.
	
]
