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

{ #category : #testing }
BlDemoClassNode >> includes: aCompiledMethod [

	| compiled |
	compiled := OrderedCollection new.
	compiled := self children collect: [ :m | m item ].
	^ compiled includes: aCompiledMethod
]

{ #category : #initialization }
BlDemoClassNode >> initialize [ 

	super initialize.
	dependencies := OrderedCollection new.
]

{ #category : #accessing }
BlDemoClassNode >> methods [ 
	^ item methods
]
