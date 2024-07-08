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

	(aFromPosition < start and: aToPosition > end) ifTrue: [
		aCar loseTire ].

	(aToPosition between: start and: end) ifTrue: [ aCar addTurnInCurve ].

	((aFromPosition between: start and: end) and:
		 (aToPosition between: start and: end) not) ifTrue: [
		aCar turnsInCurve < difficulty ifTrue: [ aCar loseTire ].
		aCar curveLeft ]
]

{ #category : #initialization }
Curve >> initializeWith: aStart end: anEnd difficulty: aDifficulty [

	start := aStart.
	end := anEnd.
	difficulty := aDifficulty
]
