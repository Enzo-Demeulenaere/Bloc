Class {
	#name : #BlThumbnailContainer,
	#superclass : #BlElement,
	#instVars : [
		'elements',
		'flap'
	],
	#category : #'Bloc-Flaps'
}

{ #category : #initialization }
BlThumbnailContainer >> defaultColor [

	^ Color lightRed
]

{ #category : #accessing }
BlThumbnailContainer >> elements [
	^ elements
]

{ #category : #accessing }
BlThumbnailContainer >> flap [

	^ flap
]

{ #category : #accessing }
BlThumbnailContainer >> flap: aBlFlap [

	flap := aBlFlap 
]

{ #category : #initialization }
BlThumbnailContainer >> initialize [

	super initialize.
	elements := OrderedCollection new.
	"self geometry: (BlRoundedRectangleGeometry cornerRadius: 10)."
	self layout: BlFlowLayout vertical.
	self constraintsDo: [ :c |
		c vertical matchParent ].
	self initializeBackground.
	self initializeBorder
]

{ #category : #initialization }
BlThumbnailContainer >> initializeBackground [

	self background: self defaultColor.
	self background opacity: 0.5
]

{ #category : #initialization }
BlThumbnailContainer >> initializeBorder [

	self border: (BlBorder paint: self defaultColor darker width: 5)
]
