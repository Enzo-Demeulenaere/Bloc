"
I compose a non-empty collection of animations that run in sequence.

My loop consists on a loop of each of my children's loop. 
Note: An infinite child animation would make that no subsequent animations are run.
"
Class {
	#name : 'BlSequentialAnimation',
	#superclass : 'BlCompositeAnimation',
	#instVars : [
		'currentIndex'
	],
	#category : 'Bloc-Animation-Basic',
	#package : 'Bloc-Animation',
	#tag : 'Basic'
}

{ #category : 'api - running' }
BlSequentialAnimation >> doStep [

	| shouldStartNext aCurrentAnimation |

	(currentIndex > animations size)
		ifTrue: [ ^ self ].

	(currentIndex isZero and: [ animations isEmpty ])
		ifTrue: [ ^ self ].

	shouldStartNext := currentIndex isZero or: [
		(animations at: currentIndex) isRunning not ].
	
	shouldStartNext ifTrue: [ 
		currentIndex := currentIndex + 1.
		
		"make sure we are not going out of bounds"
		(currentIndex > animations size)
			ifTrue: [ ^ self ] ].

	aCurrentAnimation := animations at: currentIndex.
	aCurrentAnimation run.
]

{ #category : 'api - accessing' }
BlSequentialAnimation >> duration [
	"Return animation duration. Duration can not necessarily be set manually, in case
	of composite animations it is computed on-fly based on durations of their sub-animations"

	^ animations
		  ifEmpty: [ 0 seconds ]
		  ifNotEmpty: [ :theAnimations | 
			  theAnimations sum: [ :anAnimation | 
				  anAnimation duration + anAnimation delay * anAnimation loops ] ]
]

{ #category : 'private - running' }
BlSequentialAnimation >> initStart [

	super initStart.

	currentIndex := 0.
	animations do: [ :anAnimation | anAnimation reset ]
]

{ #category : 'initialization' }
BlSequentialAnimation >> initialize [

	super initialize.

	currentIndex := 0
]
