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

{ #category : #accessing }
EDACMMethodCreated >> code [
	^ code
]

{ #category : #accessing }
EDACMMethodCreated >> code: anObject [
	code := anObject
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
