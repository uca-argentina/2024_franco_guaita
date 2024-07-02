Class {
	#name : #RallyGameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
RallyGameTest >> test01WhenPositionOfPlayerIsOneAndTurnIsPlayedThenPositionIsTwo [ 
	
	| aGame |
	aGame := RallyGame players: 'Juan'.
	
	aGame playTurn.
	
	self assert: (aGame positionOf: 'Juan') equals: 2.
	
	
	
	
	
]

{ #category : #tests }
RallyGameTest >> test02WhenPositionOfPlayerIsFiveThenPlayerWinsTheGame [
	
	| aGame |
	aGame := RallyGame players: 'Juan'.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.
	
	self assert: (aGame positionOf: 'Juan') equals: 5.
	self assert: aGame winner equals: 'Juan'. 
	
	
	
	
	
]
