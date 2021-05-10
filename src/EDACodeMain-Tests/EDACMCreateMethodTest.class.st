Class {
	#name : #EDACMCreateMethodTest,
	#superclass : #BabyMock2TestCase,
	#traits : 'EDATDomainBDD',
	#classTraits : 'EDATDomainBDD classTrait',
	#category : #'EDACodeMain-Tests'
}

{ #category : #examples }
EDACMCreateMethodTest >> createMethod_example [
	| createMethod target code methodName methodCreated |
	target := Object.
	code := [ :command | ^ 'code injected' ].
	methodName := #edacmRemoveMe.
	createMethod := EDACMCreateMethod
		withBuilder:
			(EDABuilder
				with:
					(Dictionary new
						add: 'target' -> target;
						add: 'code' -> code;
						add: 'methodName' -> methodName;
						yourself)).
	methodCreated := EDACMMethodCreated
		withBuilder:
			(EDABuilder
				with:
					createMethod).
	^ EDAExample
		when: (self serializeCommand: createMethod)
		then: (OrderedCollection with: methodCreated)
]

{ #category : #examples }
EDACMCreateMethodTest >> createMethod_test [
	| example |
	example := self createMethod_example.
	self
		whenReceiveMessage: example when
		thenEvents: example then
]

{ #category : #tests }
EDACMCreateMethodTest >> testCreateMethod [
	^ self createMethod_test
]
