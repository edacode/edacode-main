Class {
	#name : #EDACMCreateMethodTest,
	#superclass : #BabyMock2TestCase,
	#traits : 'EDATBDDHelper',
	#classTraits : 'EDATBDDHelper classTrait',
	#category : #'EDACodeMain-Tests'
}

{ #category : #examples }
EDACMCreateMethodTest >> createMethod_example [
	| createMethod target code methodName |
	target := Object.
	code := [ :command | Transcript print: 'code injected' ].
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
	^ EDAExample
		when: (self serializeCommand: createMethod)
		then:
			[ self assertMethod: createMethod methodName existsIn: createMethod target ]
]

{ #category : #examples }
EDACMCreateMethodTest >> createMethod_test [
	| example |
	example := self createMethod_example.
	self
		whenReceiveCommand: example when
		ofType: 'CREATE_METHOD'
		then: example then
]

{ #category : #tests }
EDACMCreateMethodTest >> testCreateMethod [
	^ self createMethod_test
]
