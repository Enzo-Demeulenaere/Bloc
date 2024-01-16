Class {
	#name : #BlDemoClassNode,
	#superclass : #BlDemoBasicNode,
	#instVars : [
		'dependencies'
	],
	#category : #'Bloc-Demo-Node'
}

{ #category : #accessing }
BlDemoClassNode >> dependencies [ 

	^ dependencies 
]

{ #category : #accessing }
BlDemoClassNode >> dependencies: anOrderedCollection [

	dependencies := anOrderedCollection 
]

{ #category : #accessing }
BlDemoClassNode >> icon [

	^ #class
]

{ #category : #accessing }
BlDemoClassNode >> methods [ 
	^ item methods
]
