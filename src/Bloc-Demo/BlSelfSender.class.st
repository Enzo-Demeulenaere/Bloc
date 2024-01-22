Class {
	#name : #BlSelfSender,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'messages',
		'filtered',
		'methodClass'
	],
	#category : #'Bloc-Demo-Visitor'
}

{ #category : #initialization }
BlSelfSender >> filtersNoise [

	filtered addAll: TAssertable selectors.
	filtered addAll: TBlDebug selectors
]

{ #category : #initialization }
BlSelfSender >> initialize [

	super initialize. 
	messages := Set new.
	filtered := OrderedCollection new.
	
]

{ #category : #actions }
BlSelfSender >> selfCompiledMethod: aSelector [


	^  ( methodClass lookupSelector:aSelector )
	
]

{ #category : #actions }
BlSelfSender >> selfCompiledMethods [
	
	| compiledMethods  |
	compiledMethods := Set new.
	messages do: [ :each | (self selfCompiledMethod: each) ifNotNil: [ :e | compiledMethods add: e ] ].
	^ compiledMethods
]

{ #category : #querying }
BlSelfSender >> selfMessages [
	^ messages
]

{ #category : #visiting }
BlSelfSender >> visitMessageNode: aMessageNode [

	| sel |
	sel := aMessageNode selector.
	aMessageNode isSelfSend ifTrue: [ (filtered includes: sel) ifFalse: [ messages add: sel ]].
	super visitMessageNode: aMessageNode
]

{ #category : #visiting }
BlSelfSender >> visitMethodNode: aMethodNode [

	methodClass := aMethodNode methodClass.
	super visitMethodNode: aMethodNode
]
