Class {
	#name : #BlThumbnail,
	#superclass : #BlElement,
	#instVars : [
		'element',
		'form'
	],
	#category : #'Bloc-Thumbnail-Basic'
}

{ #category : #'instance creation' }
BlThumbnail class >> createFrom: aBlElement [ 
	
	^ self new element: aBlElement; form: aBlElement aeAsForm 
]

{ #category : #hooks }
BlThumbnail >> defaultSize [ 
	^ 100@100
]

{ #category : #accessing }
BlThumbnail >> element [ 
	^ element ifNil: [ BlElement new ]
]

{ #category : #accessing }
BlThumbnail >> element: aBlElement [
	element := aBlElement 
]

{ #category : #accessing }
BlThumbnail >> form [ 
	^ form ifNil: [ self element aeAsForm ] 
]

{ #category : #accessing }
BlThumbnail >> form: aForm [

	form := aForm scaledIntoFormOfSize: self defaultSize.
	self background: self form.
]

{ #category : #initialization }
BlThumbnail >> initialize [ 
	super initialize.
	self size: self defaultSize.
]
