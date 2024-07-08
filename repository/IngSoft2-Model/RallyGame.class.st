Class {
	#name : #RallyGame,
	#superclass : #Object,
	#instVars : [
		'board',
		'cars',
		'die',
		'curves'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RallyGame class >> players: nameCollection gear: aGear boardLength: aBoardLength curves: someCurves [

	^ self new
		  initializeWithPlayers: nameCollection
		  withGear: aGear
		  withBoardLength: aBoardLength
		  withCurves: someCurves
]

{ #category : #'as yet unclassified' }
RallyGame class >> players: nameCollection gear: aGear boardLength: aBoardLength generator: aSquareGenerator curves: someCurves [

	^ self new
		  initializeWithPlayers: nameCollection
		  withGear: aGear
		  withBoardLength: aBoardLength
		  withGenerator: aSquareGenerator
		  withCurves: someCurves
]

{ #category : #initialization }
RallyGame >> advance [

	| nextCar from to |
	self isOver ifTrue: [ Error signal: 'Game is over!' ].
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

{ #category : #initialization }
RallyGame >> initializeWithPlayers: nameCollection withGear: aGear withBoardLength: aBoardLength withCurves: someCurves [

	| aSquareGenerator |
	aSquareGenerator := SquareGenerator new.
	self
		initializeWithPlayers: nameCollection
		withGear: aGear
		withBoardLength: aBoardLength
		withGenerator: aSquareGenerator
		withCurves: someCurves 
		
]

{ #category : #initialization }
RallyGame >> initializeWithPlayers: nameCollection withGear: aGear withBoardLength: aBoardLength withGenerator: aSquareGenerator withCurves: someCurves [

	board := Board length: aBoardLength withGenerator: aSquareGenerator .
	
	cars := nameCollection collect: [ :name | Car name: name gear: aGear ].
	board startingCars: cars .
	curves := someCurves 
	
	
	 
]

{ #category : #initialization }
RallyGame >> isOver [

	^ cars anySatisfy: [ :car | (self positionOf: car name) = board size ].
	"^ board last isNotEmpty ."

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
RallyGame >> positionOf: aCarName [

	
	^ board findCar: (self carNamed: aCarName )
]

{ #category : #'as yet unclassified' }
RallyGame >> shiftDownGear [
	
	| nextCar |
	nextCar := self nextCar .
	
	nextCar shiftDownGear
]

{ #category : #'as yet unclassified' }
RallyGame >> shiftUpGear [

	| nextCar |
	nextCar := self nextCar.
	nextCar shiftUpGear
]

{ #category : #'as yet unclassified' }
RallyGame >> tiresOf: aCarName [

	| aCar |
	aCar := self carNamed: aCarName.

	^ aCar tires
]

{ #category : #initialization }
RallyGame >> winner [
	
	| winnerCar |
	self isOver ifFalse: [ Error signal: 'Theres no winner yet' ].
	winnerCar := cars detect: [ :car | (self positionOf: car name) = board size ].
	^winnerCar name
]
