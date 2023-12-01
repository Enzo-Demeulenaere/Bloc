Class {
	#name : #BlFlapHandle,
	#superclass : #BlElement,
	#instVars : [
		'flap',
		'label'
	],
	#category : #'Bloc-Thumbnail'
}

{ #category : #accessing }
BlFlapHandle >> flap [
	^ flap
]

{ #category : #accessing }
BlFlapHandle >> flap: aBlFlap [ 
	flap := aBlFlap 
]
