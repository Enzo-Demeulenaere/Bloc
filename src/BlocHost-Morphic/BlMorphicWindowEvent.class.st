"
I am a super class of all window related events fired by morphic host window
"
Class {
	#name : #BlMorphicWindowEvent,
	#superclass : #WindowEvent,
	#category : #'BlocHost-Morphic-Common - Events'
}

{ #category : #accessing }
BlMorphicWindowEvent >> type [
	^ #window
]
