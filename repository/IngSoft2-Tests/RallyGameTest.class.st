Class {
	#name : #RallyGameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
RallyGameTest >> should: anErrorBlock raise: exceptionClass withMessage: anErrorMessage [ 

    self
        should: anErrorBlock
        raise: exceptionClass
        withExceptionDo: [ :error |
        self assert: error messageText equals: anErrorMessage ]
	
	
	
]

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

{ #category : #tests }
RallyGameTest >> test03ErrorWhenPositionOfPlayerIsFiveThenPlayerCannotPlayTurn [
	
	| aGame |
	aGame := RallyGame players: 'Juan'.
	
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.
	aGame playTurn.
	
	self
		should: [ aGame playTurn. ]
		raise: Error
		withMessage: 'Game is over!'
	
	
	
	
	
]

{ #category : #tests }
RallyGameTest >> test04ErrorWhenTheresNoWinnerYet [
	
	| aGame |
	aGame := RallyGame players: 'Juan'.
	
	
	self
		should: [ aGame winner]
		raise: Error
		withMessage: 'Theres no winner yet'
	
	
	
	
	
]
