Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'gameboard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
Board class >> length: aLength withGenerator: aSquareGenerator [

	^ self new initializeWith: aLength withGenerator: aSquareGenerator
]

{ #category : #initialization }
Board >> applySquareEffect: aCar [

	| currentPosition square |
	currentPosition := self findCar: aCar.

	square := gameboard at: currentPosition.

	square applyEffectTo: aCar in: self
]

{ #category : #initialization }
Board >> findCar: aCar [
	
	^ gameboard detectIndex: [ :square | square includes: aCar ]

	
]

{ #category : #initialization }
Board >> initializeWith: aLength withGenerator: aSquareGenerator [

	gameboard := OrderedCollection new: aLength.
	aLength timesRepeat: [ gameboard add: aSquareGenerator generate ]
]

{ #category : #initialization }
Board >> moveCar: aCar dieNumber: aDieNumber [
	
	| currentPosition nextPosition |
	currentPosition := self findCar: aCar.
	
	nextPosition := (currentPosition + aDieNumber ) min: gameboard size.
	
	
	(gameboard  at: currentPosition )leaves: aCar.
	(gameboard  at: nextPosition )park: aCar.
	

	
]

{ #category : #initialization }
Board >> size [

	^ gameboard size
]

{ #category : #initialization }
Board >> startingCars: someCars [
	
	someCars do: [ :car | (gameboard at: 1) park: car ].
	
	
]
