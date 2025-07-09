Class {
	#name : #BlResizingContainer,
	#superclass : #BlElement,
	#category : #'Bloc-Demo-WindowResizing'
}

{ #category : #initialization }
BlResizingContainer >> initialize [ 

	super initialize.
	self constraintsDo: [ :c | c horizontal matchParent.
		c vertical matchParent ].
	self layout: (BlGridLayout horizontal columnCount: 2).
	
	self initializeElements.
]

{ #category : #initialization }
BlResizingContainer >> initializeElements [ 

	1 to: 4 do: [ :i | 
		self addChild: BlResizingElement new ].
]
