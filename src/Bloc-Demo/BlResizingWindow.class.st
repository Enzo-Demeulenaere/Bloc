Class {
	#name : #BlResizingWindow,
	#superclass : #BlElement,
	#instVars : [
		'container',
		'interactionMap'
	],
	#category : #'Bloc-Demo-WindowResizing'
}

{ #category : #initialization }
BlResizingWindow >> initialize [ 

	super initialize.
	self constraintsDo: [ :c | c horizontal matchParent.
		c vertical matchParent ].
	
	self initializeContainer.
	self initializeInteractionMap.
]

{ #category : #initialization }
BlResizingWindow >> initializeContainer [ 

	container := BlResizingContainer new.
	self addChild: container
]

{ #category : #initialization }
BlResizingWindow >> initializeInteractionMap [ 

	interactionMap := BlResizingInteractionMap new
]

{ #category : #running }
BlResizingWindow >> run [ 

	<script: 'self new openInSpace'>
]
