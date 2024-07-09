Class {
	#name : #SquareGenerator,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #translating }
SquareGenerator >> generate [

	| random |
	random := (1 to: 10) atRandom.
	(random between: 1 and: 7) ifTrue: [ ^ PavementSquare new ].
	(random between: 8 and: 9) ifTrue: [ ^ OilSquare new ].
	random = 10 ifTrue: [ ^ RubberSquare new ]
]
