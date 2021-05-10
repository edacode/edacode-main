Extension { #name : #EDACommandDispatcher }

{ #category : #'*EDACodeMain-Support' }
EDACommandDispatcher >> retrieveHandlerFor: aCommand [
	^ (EDACMCommandDispatcher supports: aCommand)
		ifTrue: [ EDACMCommandDispatcher new ]
		ifFalse: [ self handlersRegistry handlerForCommand: aCommand ]
]
