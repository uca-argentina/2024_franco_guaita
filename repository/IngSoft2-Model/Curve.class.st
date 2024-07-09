Class {
	#name : #Curve,
	#superclass : #Object,
	#instVars : [
		'start',
		'end',
		'difficulty'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Curve class >> start: aStart end: anEnd difficulty: aDifficulty [

	^ self new initializeWith: aStart end: anEnd difficulty: aDifficulty
]

{ #category : #'as yet unclassified' }
Curve >> car: aCar movedFrom: aFromPosition to: aToPosition [

	| landsInCurve skipsCurve isInCurve |
	landsInCurve := aToPosition between: start and: end.
	skipsCurve := aFromPosition < start and: aToPosition > end.
	isInCurve := aFromPosition between: start and: end.

	skipsCurve ifTrue: [ aCar loseTire ].
	landsInCurve ifTrue: [ aCar addTurnInCurve ].

	(isInCurve and: landsInCurve not) ifTrue: [
		aCar turnsInCurve < difficulty ifTrue: [ aCar loseTire ].
		aCar curveLeft ]
]

{ #category : #initialization }
Curve >> initializeWith: aStart end: anEnd difficulty: aDifficulty [

	start := aStart.
	end := anEnd.
	difficulty := aDifficulty
]
