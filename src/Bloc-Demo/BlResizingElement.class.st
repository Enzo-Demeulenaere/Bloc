Class {
	#name : #BlResizingElement,
	#superclass : #BlElement,
	#category : #'Bloc-Demo-WindowResizing'
}

{ #category : #initialization }
BlResizingElement >> initialize [ 

	| color |
	super initialize.
	color := Color random.
	self background: color lighter .
	self border: (BlBorder paint: color width: 10).
	self constraintsDo: [ :c | c horizontal matchParent. c vertical matchParent ].
	
	self initializeEvents
]

{ #category : #initialization }
BlResizingElement >> initializeEvents [

	| originalPos offset originalWidth originalHeight |
	self addEventHandlerOn: BlDragStartEvent do: [ :evt |
			evt consume.
			offset := evt position - self positionInSpace.
			originalPos := evt position.
			originalWidth := self width.
			originalHeight := self height. ].

	self addEventHandlerOn: BlDragEvent do: [ :evt |
			evt consume.
			(evt position x - originalPos x) abs
			> (evt position y - originalPos y) abs
				ifTrue: [  ]
				ifFalse: [ ] ]
]
