Class {
	#name : #SquareGenerator,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #translating }
SquareGenerator >> generate [

	| random |
	random := (1 to: 10) atRandom.
	(random between: 1 and: 7) ifTrue: [ ^ RubberSquare new ].
	(random between: 8 and: 9) ifTrue: [ ^ PavementSquare new ].
	random = 10 ifTrue: [ ^ RubberSquare new ]
]