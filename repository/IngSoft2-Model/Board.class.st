Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'gameboard',
		'curves'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
Board class >> length: aLength withGenerator: aSquareGenerator withCars: someCars withCurves: someCurves [

	^ self new
		  initializeWith: aLength
		  withGenerator: aSquareGenerator
		  withCars: someCars
		  withCurves: someCurves
]

{ #category : #initialization }
Board >> advance: aCar [

	| from to |
	from := self findCar: aCar.
	aCar moveIn: self.
	self applySquareEffect: aCar.
	to := self findCar: aCar.
	curves do: [ :eachCurve | eachCurve car: aCar movedFrom: from to: to ]
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
Board >> initializeWith: aLength withGenerator: aSquareGenerator withCars: someCars withCurves: someCurves [

	gameboard := OrderedCollection new: aLength.
	aLength timesRepeat: [ gameboard add: aSquareGenerator generate ].
	someCars do: [ :car | (gameboard at: 1) park: car ].
	curves := someCurves
]

{ #category : #initialization }
Board >> moveCar: aCar dieNumber: aDieNumber [

	| currentPosition nextPosition |
	currentPosition := self findCar: aCar.
	nextPosition := currentPosition + aDieNumber min: gameboard size.
	(gameboard at: currentPosition) leaves: aCar.
	(gameboard at: nextPosition) park: aCar
]

{ #category : #initialization }
Board >> size [

	^ gameboard size
]
