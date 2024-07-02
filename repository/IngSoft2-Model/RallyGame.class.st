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
RallyGame class >> players: nameCollection die: aDie boardLength: aBoardLength [

	^ self new initializeWithPlayers: nameCollection withDie: aDie withBoardLength: aBoardLength  .
]

{ #category : #initialization }
RallyGame >> initializeWithPlayers: nameCollection withDie: aDie withBoardLength: aBoardLength [
	board := OrderedCollection new: aBoardLength withAll: nil.
	"cars := Car name: nameCollection ."
	cars := nameCollection.
	board at: 1 put: cars .
	die := aDie .
	
	 
]

{ #category : #initialization }
RallyGame >> isOver [

	^ board last isNil

]

{ #category : #initialization }
RallyGame >> playTurn [

	| position dieNumber |
	
	self isOver ifFalse: [ Error signal: 'Game is over!' ].
	dieNumber := die throw .
	position := board indexOf: cars.

	board at: position put: nil.
	board at: position + dieNumber put: cars.
]

{ #category : #initialization }
RallyGame >> positionOf: aCarName [

	^ board indexOf: aCarName .
	"^ board detectIndex: [ :car | car name = aCarName ]"
]

{ #category : #initialization }
RallyGame >> winner [
	
	self isOver ifTrue: [ Error signal: 'Theres no winner yet' ].
	^ board last. 
]
