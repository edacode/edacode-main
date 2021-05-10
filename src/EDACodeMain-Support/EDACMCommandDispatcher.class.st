Class {
	#name : #EDACMCommandDispatcher,
	#superclass : #EDACommandDispatcher,
	#traits : 'EDATErrorHelper',
	#classTraits : 'EDATErrorHelper classTrait',
	#category : #'EDACodeMain-Support'
}

{ #category : #testing }
EDACMCommandDispatcher class >> supports: aCommand [
	^ aCommand isKindOf: EDACMCommand
]

{ #category : #'command handling' }
EDACMCommandDispatcher >> handle: aCommand withErrorStrategy: aStrategy [
	[ EDACMObjectProxy new handle: aCommand ]
		on: Exception - Break
		do:
			[ :ex | self manageError: ex for: aCommand usingErrorStrategy: aStrategy ]
]
