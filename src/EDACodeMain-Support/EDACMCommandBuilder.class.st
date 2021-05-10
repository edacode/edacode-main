Class {
	#name : #EDACMCommandBuilder,
	#superclass : #EDABuilder,
	#traits : 'EDATCommandBuilder + EDATTypeAttributeBuilder',
	#classTraits : 'EDATCommandBuilder classTrait + EDATTypeAttributeBuilder classTrait',
	#category : #'EDACodeMain-Support'
}

{ #category : #accessing }
EDACMCommandBuilder class >> priority [
	^ 40
]

{ #category : #building }
EDACMCommandBuilder >> build [
	| candidates type |
	type := self retrieveType: self params.
	candidates := EDACMCommand subclasses
		select: [ :c | c commandName = type ].
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
