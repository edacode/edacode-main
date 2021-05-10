Class {
	#name : #EDACMObjectProxy,
	#superclass : #EDAAggregateRoot,
	#instVars : [
		'edacmMethodsInClass'
	],
	#category : #EDACodeMain
}

{ #category : #accessing }
EDACMObjectProxy >> addEDACMMethod: aCode named: aString in: aSymbol [
	| methods |
	methods := self edacmMethodsInClass
		at: aSymbol
		ifAbsent: [ Dictionary new ].
	methods at: aString put: aCode
]

{ #category : #accessing }
EDACMObjectProxy >> applyMethodCreatedv1: anEvent [
	self
		addEDACMMethod: anEvent code
		named: anEvent methodName
		in: anEvent target asSymbol
]

{ #category : #initialization }
EDACMObjectProxy >> doInitialize [
	self edacmMethodsInClass: Dictionary new
]

{ #category : #accessing }
EDACMObjectProxy >> edacmMethodsInClass [
	^ edacmMethodsInClass
]

{ #category : #accessing }
EDACMObjectProxy >> edacmMethodsInClass: anObject [
	edacmMethodsInClass := anObject
]

{ #category : #accessing }
EDACMObjectProxy >> handle: aCommand [
	^ EDACMMethodCreated withBuilder: (EDABuilder with: aCommand)
]

{ #category : #initialization }
EDACMObjectProxy >> initialize [
	super initialize.
	self doInitialize
]
