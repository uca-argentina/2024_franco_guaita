Class {
	#name : #RallyGame,
	#superclass : #Object,
	#instVars : [
		'board',
		'cars',
		'die'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RallyGame class >> players: nameCollection gear: aGear boardLength: aBoardLength [

	^ self new initializeWithPlayers: nameCollection withGear: aGear  withBoardLength: aBoardLength  .
]

{ #category : #initialization }
RallyGame >> advance [

	| nextCar |
	self isOver ifTrue: [ Error signal: 'Game is over!' ].
	nextCar := self nextCar .
	nextCar moveIn: board
]

{ #category : #initialization }
RallyGame >> initializeWithPlayers: nameCollection withGear: aGear withBoardLength: aBoardLength [
	board := OrderedCollection new.
	aBoardLength timesRepeat: [ board add: OrderedCollection new ].
	
	cars := nameCollection collect: [ :name | Car name: name gear: aGear ].
	cars do: [ :car | (board at: 1 ) add: car ]
	
	
	 
]

{ #category : #initialization }
RallyGame >> isOver [

	^ board last isNotEmpty .

]

{ #category : #initialization }
RallyGame >> nextCar [

	| nextCar |
	nextCar := cars removeFirst.
	cars addLast: nextCar .
	^nextCar
]

{ #category : #initialization }
RallyGame >> positionOf: aCarName [

	| vcar |
	vcar := cars detect: [ :car | car name = aCarName ].
	^ board detectIndex: [ :position | position includes: vcar ]
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

{ #category : #initialization }
RallyGame >> winner [
	
	self isOver ifFalse: [ Error signal: 'Theres no winner yet' ].
	^ (board last) first name. 
]
