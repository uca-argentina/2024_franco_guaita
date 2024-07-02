Class {
	#name : #RallyGame,
	#superclass : #Object,
	#instVars : [
		'board',
		'cars'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RallyGame class >> players: nameCollection [

	^ self new initializeWithPlayers: nameCollection 
]

{ #category : #initialization }
RallyGame >> initializeWithPlayers: nameCollection [ 
	board := OrderedCollection new: 5 withAll: nil.
	"cars := Car name: nameCollection ."
	cars := nameCollection.
	board at: 1 put: cars .
	
	 
]

{ #category : #initialization }
RallyGame >> isOver [

	^ board last isNil

]

{ #category : #initialization }
RallyGame >> playTurn [

	| position |
	self isOver ifFalse: [ Error signal: 'Game is over!' ].
	position := board indexOf: cars.

	board at: position put: nil.
	board at: position + 1 put: cars.
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
