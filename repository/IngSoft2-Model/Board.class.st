Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'squares',
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
	square := squares at: currentPosition.
	square applyEffectTo: aCar in: self
]

{ #category : #initialization }
Board >> findCar: aCar [

	^ squares detectIndex: [ :square | square includes: aCar ]
]

{ #category : #initialization }
Board >> initializeWith: aLength withGenerator: aSquareGenerator withCars: someCars withCurves: someCurves [

	squares := OrderedCollection new: aLength.
	aLength timesRepeat: [ squares add: aSquareGenerator generate ].
	someCars do: [ :car | (squares at: 1) park: car ].
	curves := someCurves
]

{ #category : #initialization }
Board >> move: aCar by: aNumberOfTimes [

	| currentPosition nextPosition |
	currentPosition := self findCar: aCar.
	nextPosition := currentPosition + aNumberOfTimes min: squares size.
	(squares at: currentPosition) leaves: aCar.
	(squares at: nextPosition) park: aCar
]

{ #category : #accessing }
Board >> size [

	^ squares size
]
