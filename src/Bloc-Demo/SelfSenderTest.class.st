Class {
	#name : #SelfSenderTest,
	#superclass : #TestCase,
	#category : #'Bloc-Demo-Tests'
}

{ #category : #tests }
SelfSenderTest >> testFilterAssertAndFriends [

	| ast vis |
	ast := (BlOnceLayoutTest>>#testOnceLinearLayoutMatchParent) ast.
	vis := BlSelfSender new.
	vis filtersNoise.
	vis  visit: ast.
	self assert: (vis selfMessages includes: #parentWithFixedSize).
	self assert: vis selfMessages size equals: 2.
]

{ #category : #tests }
SelfSenderTest >> testFindSelfSend [

	| ast vis |
	ast := (BlOnceLayoutTest>>#testOnceLinearLayoutMatchParent) ast.
	vis := BlSelfSender new.
	vis  visit: ast.
	self assert: (vis selfMessages includes: #parentWithFixedSize).
	self assert: vis selfMessages size equals: 4.
]

{ #category : #tests }
SelfSenderTest >> testSelfSendCompiledMethods [
	| ast vis compiledMethod |
	ast := (BlOnceLayoutTest>>#testOnceLinearLayoutMatchParent) ast.
	vis := BlSelfSender new.
	vis filtersNoise.
	vis  visit: ast.
	compiledMethod := vis selfCompiledMethods asOrderedCollection first.
	self assert: compiledMethod methodClass equals: BlRootLayoutTest.
	self assert: compiledMethod selector equals: #parentWithFixedSize.
	
	compiledMethod := vis selfCompiledMethods asOrderedCollection second.
	self assert: compiledMethod methodClass equals: BlRootLayoutTest.
	self assert: compiledMethod selector equals: #testChildElementMatchingParent.
	
	
]
