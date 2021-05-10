Class {
	#name : #BaselineOfEDACodeMain,
	#superclass : #BaselineOf,
	#category : #BaselineOfEDACodeMain
}

{ #category : #baselines }
BaselineOfEDACodeMain >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			self
				declarePharoEDAIn: spec
				groups: (OrderedCollection with: 'default').
			self declarePackagesIn: spec.
			self declareGroupsIn: spec ]
]

{ #category : #meta }
BaselineOfEDACodeMain >> declareGroupsIn: spec [
	spec
		group: 'core' with: #(#EDACodeMain #'EDACodeMain-Support');
		group: 'tests' with: #(#'EDACodeMain-Tests');
		group: 'default' with: #('core' 'tests')
]

{ #category : #meta }
BaselineOfEDACodeMain >> declarePackagesIn: spec [
	spec
		package: #EDACodeMain with: [ spec requires: #('PharoEDA') ];
		package: #'EDACodeMain-Support' with: [ spec requires: #('PharoEDA' 'EDACodeMain') ];
		package: #'EDACodeMain-Tests'
			with: [ spec requires: #('EDACodeMain') ]
]

{ #category : #baselines }
BaselineOfEDACodeMain >> declarePharoEDAIn: spec groups: aGroupCollection [
	spec
		baseline: 'PharoEDA'
		with: [ spec
				repository: 'github://osoco/pharo-eda:event-listening/src';
				loads: aGroupCollection ].
	^ spec
]
