Class {
	#name : #BlVerticalThumbnailContainer,
	#superclass : #BlThumbnailContainer,
	#category : #'Bloc-Flaps'
}

{ #category : #initialization }
BlVerticalThumbnailContainer >> initializeConstraints [ 
	
	self constraintsDo: [ :c | c horizontal matchParent ].
]

{ #category : #initialization }
BlVerticalThumbnailContainer >> initializeLayout [

	self layout: BlFlowLayout horizontal
]
