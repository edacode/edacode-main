Class {
	#name : #EDACMCreateMethod,
	#superclass : #EDACMCommand,
	#instVars : [
		'target',
		'code',
		'methodName'
	],
	#category : #EDACodeMain
}

{ #category : #meta }
EDACMCreateMethod class >> aggregateRootClass [
	^ EDACMObjectProxy
]

{ #category : #'instance creation' }
EDACMCreateMethod class >> commandName [
	^ #CREATE_METHOD
]

{ #category : #accessing }
EDACMCreateMethod class >> latestVersion [
	<doc: 'Updates the latest version of the command class'>
	^ 1
]

{ #category : #'instance creation' }
EDACMCreateMethod class >> withBuilder: aBuilder [
	<commandName: #CREATE_METHOD>
	<builderClass: #EDABuilder>
	| result |
	result := aBuilder
		withTarget;
		withMethodName;
		withCode;
		build: self.
	result version: self latestVersion.
	^ result
]

{ #category : #accessing }
EDACMCreateMethod >> code [
	^ code
]

{ #category : #accessing }
EDACMCreateMethod >> code: anObject [
	code := anObject
]

{ #category : #accessing }
EDACMCreateMethod >> methodName [
	^ methodName
]

{ #category : #accessing }
EDACMCreateMethod >> methodName: anObject [
	methodName := anObject
]

{ #category : #accessing }
EDACMCreateMethod >> target [
	^ target
]

{ #category : #accessing }
EDACMCreateMethod >> target: anObject [
	target := anObject
]
