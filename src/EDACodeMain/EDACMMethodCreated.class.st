Class {
	#name : #EDACMMethodCreated,
	#superclass : #EDACMEvent,
	#instVars : [
		'target',
		'methodName',
		'code'
	],
	#category : #EDACodeMain
}

{ #category : #'instance creation' }
EDACMMethodCreated class >> withBuilder: aBuilder [
	<eventName: #METHOD_CREATED>
	<builderClass: #EDABuilder>
	^ aBuilder
		withTarget;
		withMethodName;
		withCode;
		build: self
]

{ #category : #comparing }
EDACMMethodCreated >> = anInstance [
	^ self class = anInstance class
		and: [ self id = anInstance id
				and:
					[ self methodName = anInstance methodName and: [ self target = anInstance target and: [ self code = anInstance code and: [ self version = anInstance version ] ] ] ] ]
]

{ #category : #accessing }
EDACMMethodCreated >> code [
	^ code
]

{ #category : #accessing }
EDACMMethodCreated >> code: anObject [
	code := anObject
]

{ #category : #comparing }
EDACMMethodCreated >> hash [
	^ self class hash
		bitXor: ( self id hash
				bitXor: ( self methodName hash
						bitXor: ( self target hash bitXor: ( self code hash bitXor: ( self version hash )))))
]

{ #category : #accessing }
EDACMMethodCreated >> methodName [
	^ methodName
]

{ #category : #accessing }
EDACMMethodCreated >> methodName: anObject [
	methodName := anObject
]

{ #category : #accessing }
EDACMMethodCreated >> target [
	^ target
]

{ #category : #accessing }
EDACMMethodCreated >> target: anObject [
	target := anObject
]
