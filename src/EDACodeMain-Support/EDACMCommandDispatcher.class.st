Class {
	#name : #EDACMCommandDispatcher,
	#superclass : #EDACommandDispatcher,
	#category : #'EDACodeMain-Support'
}

{ #category : #testing }
EDACMCommandDispatcher class >> supports: aCommand [
	^ aCommand isKindOf: EDACMCommand
]

{ #category : #'command handling' }
EDACMCommandDispatcher >> handle: aCommand withErrorStrategy: aString [
	self shouldBeImplemented
]
