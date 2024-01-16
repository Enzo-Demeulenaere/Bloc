Class {
	#name : #BlDemoDependencyNode,
	#superclass : #BlDemoMethodNode,
	#category : #'Bloc-Demo-Node'
}

{ #category : #accessing }
BlDemoDependencyNode >> execute [

	^ BlElement new
		  background: Color lightBlue; size: 100@100
]

{ #category : #accessing }
BlDemoDependencyNode >> icon [

	^ #glamorousGrayCircleEmpty 
	
]
