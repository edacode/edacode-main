Class {
	#name : #EDACMCommandBuilder,
	#superclass : #EDABuilder,
	#traits : 'EDATCommandBuilder + EDATTypeAttributeBuilder',
	#classTraits : 'EDATCommandBuilder classTrait + EDATTypeAttributeBuilder classTrait',
	#category : #'EDACodeMain-Support'
}

{ #category : #'instance creation' }
EDACMCommandBuilder class >> objectify: aDictionary [
	| result |
	result := Dictionary new.
	aDictionary
		keysAndValuesDo: [ :k :v | 
			| value |
			value := v.
			k = 'target'
				ifTrue: [ value := self environment at: v asSymbol ].
			k = 'code'
				ifTrue: [ value := BlockClosure readFromString: v ].
			k = 'methodName' ifTrue: [ value := v asSymbol ].
			result at: k put: value ].
	^ result
]

{ #category : #accessing }
EDACMCommandBuilder class >> priority [
	^ 40
]

{ #category : #'instance creation' }
EDACMCommandBuilder class >> with: anInstance [
	| result |
	result := self new.
	result params: (self objectify: anInstance asDictionary).
	^ result
]

{ #category : #building }
EDACMCommandBuilder >> build [
	| candidates type |
	type := self retrieveType: self params.
	candidates := EDACMCommand subclasses
		select: [ :c | c commandNameMatches: type ].
	^ candidates
		ifEmpty: [ nil ]
		ifNotEmpty: [ candidates first withBuilder: self ]
]

{ #category : #testing }
EDACMCommandBuilder >> messageSupported [
	^ self supportedType and: [ self params at: 'target' ifPresent: [ true ] ifAbsent: [ false ] ]
]

{ #category : #testing }
EDACMCommandBuilder >> supportedType [
	| type |
	type := self retrieveType: self params.
	^ #('CREATE_METHOD') includes: type
]
