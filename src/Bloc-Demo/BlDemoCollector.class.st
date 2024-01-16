Class {
	#name : #BlDemoCollector,
	#superclass : #Object,
	#instVars : [
		'packageDict',
		'classDict',
		'pragma'
	],
	#category : #'Bloc-Demo-Node'
}

{ #category : #'instance creation' }
BlDemoCollector class >> collectClass: aClass [ 
	^ self new collectClass: aClass.
]

{ #category : #'instance creation' }
BlDemoCollector class >> collectPackage: aPackage [

	^ self new collectPackage: aPackage
]

{ #category : #'as yet unclassified' }
BlDemoCollector class >> collectPragma: aSymbol fromClass: aClass [

	^ self new
		  pragma: aSymbol;
		  collectClass: aClass 
]

{ #category : #'as yet unclassified' }
BlDemoCollector class >> collectPragma: aSymbol fromPackage: aPackage [ 
	^ self new pragma: aSymbol; collectPackage: aPackage 
]

{ #category : #accessing }
BlDemoCollector >> classes [
	^ classDict values
]

{ #category : #instanceCreation }
BlDemoCollector >> collectClass: aClass [

	| node pragmas |
	pragmas := Pragma allNamed: pragma in: aClass.
	pragmas ifEmpty: [ ^ self ].
	node := self ensureClassFor: aClass.
	pragmas do: [ :prag |
		node addChild: (BlDemoMethodNode new item: prag method) ].
	self collectDependencies: node
]

{ #category : #'as yet unclassified' }
BlDemoCollector >> collectDependencies: aClassNode [

	| node dependencies |
	node := aClassNode.
	dependencies := OrderedCollection new.
	node methods do: [ :method |
		method selfMessages asOrderedCollection do: [ :e |
			|selectors|
			selectors := node item methodDict values collect: [ :each | each selector ].
			(selectors includes: e) ifTrue: [ 
				|m|
				m := node item methodNamed: e.
				dependencies add: (BlDemoDependencyNode withItem: m) ] ] ].
	node dependencies: dependencies.
	node addChildren: dependencies
]

{ #category : #instanceCreation }
BlDemoCollector >> collectPackage: aRPackage [

	| node classes |
	classes := OrderedCollection new.
	aRPackage classes do: [ :class |
		| temp |
		self collectClass: class.
		temp := classDict at: class ifAbsent: [  ].
		temp ifNotNil: [ classes add: temp ] ].
	classes ifEmpty: [ ^ self ].
	node := self ensurePackageFor: aRPackage.
	classes do: [ :classNode | node addChild: classNode ]
]

{ #category : #'as yet unclassified' }
BlDemoCollector >> collectPackages: anOrderedCollection [

	anOrderedCollection do: [ :each | self collectPackage: each ].
]

{ #category : #'as yet unclassified' }
BlDemoCollector >> ensureClassFor: aClass [

	^ classDict at: aClass ifAbsentPut: [BlDemoClassNode new item: aClass; yourself]
]

{ #category : #'as yet unclassified' }
BlDemoCollector >> ensurePackageFor: aPackage [ 

	^ packageDict at: aPackage ifAbsentPut: [ BlDemoPackageNode new item: aPackage; yourself]
]

{ #category : #initialization }
BlDemoCollector >> initialize [
	super initialize.
	pragma := #demo.
	packageDict := IdentityDictionary new.
	classDict := IdentityDictionary new
]

{ #category : #accessing }
BlDemoCollector >> packages [
	^ packageDict values
]

{ #category : #accessing }
BlDemoCollector >> pragma: aString [ 
	pragma := aString
]
