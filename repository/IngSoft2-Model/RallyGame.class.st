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
	
	self isOver ifTrue: [ Error signal: 'Game is over!' ].
	cars first moveIn: board .
]

{ #category : #initialization }
RallyGame >> initializeWithPlayers: nameCollection withGear: aGear withBoardLength: aBoardLength [
	board := OrderedCollection new: aBoardLength withAll: nil.
	"cars := Car name: nameCollection ."
	cars := {Car name: nameCollection gear: aGear }.
	board at: 1 put: cars first .
	
	
	 
]

{ #category : #initialization }
RallyGame >> isOver [

	^ board last isNotNil 

]

{ #category : #initialization }
RallyGame >> positionOf: aCarName [
	"^ board indexOf: aCarName ."
	| vcar |
	vcar := cars detect: [ :car | car name = aCarName ].
	^ board indexOf: vcar
]

{ #category : #'as yet unclassified' }
RallyGame >> shiftUpGear [

	cars first shiftUpGear
]

{ #category : #initialization }
RallyGame >> winner [
	
	self isOver ifFalse: [ Error signal: 'Theres no winner yet' ].
	^ (board last) name. 
]
