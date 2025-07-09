Class {
	#name : #BlResizingInteractionMap,
	#superclass : #BlElement,
	#category : #'Bloc-Demo-WindowResizing'
}

{ #category : #initialization }
BlResizingInteractionMap >> initialize [ 
	
	super initialize.
	self constraintsDo: [ :c | c horizontal matchParent. c vertical matchParent ].
]
