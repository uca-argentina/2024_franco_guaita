Class {
	#name : #RallyGame,
	#superclass : #Object,
	#instVars : [
		'board',
		'cars',
		'die',
		'curves',
		'lenghtInKm'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RallyGame class >> players: nameCollection boardLength: aBoardLength curves: someCurves lengthInKm: aKmLength [

	^ self new
		  initializeWithPlayers: nameCollection
		  withBoardLength: aBoardLength
		  withCurves: someCurves
		  withKm: aKmLength
]

{ #category : #'as yet unclassified' }
RallyGame class >> players: nameCollection gear: aGear boardLength: aBoardLength generator: aSquareGenerator curves: someCurves lengthInKm: aKmLength [

	^ self new
		  initializeWithPlayers: nameCollection
		  withGear: aGear
		  withBoardLength: aBoardLength
		  withGenerator: aSquareGenerator
		  withCurves: someCurves
		  withKm: aKmLength
]

{ #category : #initialization }
RallyGame >> advance [

	| nextCar from to |
	self throwIfGameIsOver .
	nextCar := self nextCar.

	from := board findCar: nextCar.
	nextCar moveIn: board.
	board applySquareEffect: nextCar.
	to := board findCar: nextCar.

	curves do: [ :eachCurve | eachCurve car: nextCar movedFrom: from to: to ] 
]

{ #category : #initialization }
RallyGame >> carNamed: aCarName [

	^ cars detect: [ :car | car name = aCarName ]
]

{ #category : #'as yet unclassified' }
RallyGame >> gearOf: aCarName [

	| aCar |
	aCar := self carNamed: aCarName.

	^ aCar currentGear 
]

{ #category : #initialization }
RallyGame >> initializeWithPlayers: nameCollection withBoardLength: aBoardLength withCurves: someCurves withKm: aKmLength [

	| defaultGear |
	defaultGear := {
		               (Die min: 1 max: 3).
		               (Die min: 2 max: 4).
		               (Die min: 5 max: 8).
		               (Die min: 7 max: 11).
		               (Die min: 1 max: 20) } asOrderedCollection.

	^ self
		  initializeWithPlayers: nameCollection
		  withGear: defaultGear
		  withBoardLength: aBoardLength
		  withCurves: someCurves
		  withKm: aKmLength
]

{ #category : #initialization }
RallyGame >> initializeWithPlayers: nameCollection withGear: aGear withBoardLength: aBoardLength withCurves: someCurves withKm: aKmLength [

	| aSquareGenerator |
	aSquareGenerator := SquareGenerator new.
	self
		initializeWithPlayers: nameCollection
		withGear: aGear
		withBoardLength: aBoardLength
		withGenerator: aSquareGenerator
		withCurves: someCurves
		withKm: aKmLength
]

{ #category : #initialization }
RallyGame >> initializeWithPlayers: nameCollection withGear: aGear withBoardLength: aBoardLength withGenerator: aSquareGenerator withCurves: someCurves withKm: aKmLength [

	cars := nameCollection collect: [ :name | Car name: name gear: aGear ].
	board := Board
		         length: aBoardLength
		         withGenerator: aSquareGenerator
		         withCars: cars.

	curves := someCurves.
	lenghtInKm := aKmLength
]

{ #category : #initialization }
RallyGame >> isOver [

	^ (cars anySatisfy: [ :car |
		   (self positionOf: car name) = board size ]) or:
		  (cars allSatisfy: [ :car | car noTiresLeft ])
]

{ #category : #'as yet unclassified' }
RallyGame >> kilometersOf: aCarName [

	| position kmPerSquare |
	position := self positionOf: aCarName.
	kmPerSquare := lenghtInKm / board size.
	^ kmPerSquare * (position - 1)
]

{ #category : #initialization }
RallyGame >> nextCar [

	| currentCar |
	currentCar := cars removeFirst.
	cars addLast: currentCar.

	[ currentCar canPlay ] whileFalse: [
		currentCar turnLost.
		currentCar := cars removeFirst.
		cars addLast: currentCar ].

	^ currentCar
]

{ #category : #initialization }
RallyGame >> nextToPlay [

	| car |
	car := self nextCar .
	cars addFirst: car .
	^ car name
]

{ #category : #initialization }
RallyGame >> positionOf: aCarName [

	
	^ board findCar: (self carNamed: aCarName )
]

{ #category : #'as yet unclassified' }
RallyGame >> shiftDownGear [

	| nextCar |
	self throwIfGameIsOver .
	nextCar := self nextCar.

	nextCar shiftDownGear
]

{ #category : #'as yet unclassified' }
RallyGame >> shiftUpGear [

	| nextCar |
	self throwIfGameIsOver .
	nextCar := self nextCar.
	nextCar shiftUpGear
]

{ #category : #initialization }
RallyGame >> throwIfGameIsOver [

	self isOver ifTrue: [ Error signal: 'Game is over!' ]
]

{ #category : #'as yet unclassified' }
RallyGame >> tiresOf: aCarName [

	| aCar |
	aCar := self carNamed: aCarName.

	^ aCar tires
]

{ #category : #initialization }
RallyGame >> winner [

	| winnerCar sortedCars |
	self isOver ifFalse: [ Error signal: 'Theres no winner yet' ].

	sortedCars := cars sorted: [ :aCar :anotherCar |
		              (self positionOf: aCar name)
		              > (self positionOf: anotherCar name) ].
	winnerCar := sortedCars first.
	^ winnerCar name
]
