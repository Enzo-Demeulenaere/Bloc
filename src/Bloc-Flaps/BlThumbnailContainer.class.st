Class {
	#name : 'BlThumbnailContainer',
	#superclass : 'BlElement',
	#instVars : [
		'elements',
		'flap'
	],
	#category : 'Bloc-Flaps',
	#package : 'Bloc-Flaps'
}

{ #category : 'adding' }
BlThumbnailContainer >> addElement: aBlElement [

	self elements add: aBlElement.
	self addChild: aBlElement 
]

{ #category : 'adding' }
BlThumbnailContainer >> addElements: aCollection [

	aCollection do: [ :each | self elements add: each.
		self addChild: each ]
]

{ #category : 'initialization' }
BlThumbnailContainer >> defaultColor [

	^ Color lightRed
]

{ #category : 'accessing' }
BlThumbnailContainer >> elements [
	^ elements
]

{ #category : 'accessing' }
BlThumbnailContainer >> flap [

	^ flap
]

{ #category : 'accessing' }
BlThumbnailContainer >> flap: aBlFlap [

	flap := aBlFlap 
]

{ #category : 'initialization' }
BlThumbnailContainer >> initialize [

	super initialize.
	elements := OrderedCollection new.
	self initializeLayout.
	self initializeConstraints.
	self initializeBackground.
	self initializeBorder
]

{ #category : 'initialization' }
BlThumbnailContainer >> initializeBackground [

	self background: self defaultColor.
	self background opacity: 0.5
]

{ #category : 'initialization' }
BlThumbnailContainer >> initializeBorder [

	self border: (BlBorder paint: self defaultColor darker width: 5)
]
