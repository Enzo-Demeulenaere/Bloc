Class {
	#name : 'BlHorizontalThumbnailContainer',
	#superclass : 'BlThumbnailContainer',
	#category : 'Bloc-Flaps',
	#package : 'Bloc-Flaps'
}

{ #category : 'initialization' }
BlHorizontalThumbnailContainer >> initializeConstraints [ 

	self constraintsDo: [ :c | c vertical matchParent ].
]

{ #category : 'initialization' }
BlHorizontalThumbnailContainer >> initializeLayout [

	self layout: BlFlowLayout vertical.
]
