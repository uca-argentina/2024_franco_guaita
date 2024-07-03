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
	aGame := RallyGame players: 'Juan' gear: {LoadedDie sequence: #(1)} boardLength: 5.
	
	aGame advance.
	
	self assert: (aGame positionOf: 'Juan') equals: 2.
	
	
	
	
	
]

{ #category : #tests }
RallyGameTest >> test02WhenPositionOfPlayerIsFiveThenPlayerWinsTheGame [
	
	| aGame |
	aGame := RallyGame players: 'Juan' gear: {LoadedDie sequence: #(1)} boardLength: 5.
	
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	
	self assert: (aGame positionOf: 'Juan') equals: 5.
	self assert: aGame winner equals: 'Juan'. 
	
	
	
	
	
]

{ #category : #tests }
RallyGameTest >> test03ErrorWhenPositionOfPlayerIsFiveThenPlayerCannotPlayTurn [
	
	| aGame |
	aGame := RallyGame players: 'Juan' gear: {LoadedDie sequence: #(1)} boardLength: 5.
	
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	
	self
		should: [ aGame advance. ]
		raise: Error
		withMessage: 'Game is over!'
	
	
	
	
	
]

{ #category : #tests }
RallyGameTest >> test04ErrorWhenTheresNoWinnerYet [
	
	| aGame |
	aGame := RallyGame players: 'Juan' gear: {LoadedDie sequence: #(1)} boardLength: 5.
	
	
	self
		should: [ aGame winner]
		raise: Error
		withMessage: 'Theres no winner yet'
	
	
	
	
	
]

{ #category : #tests }
RallyGameTest >> test05WhenDieThrowsTwoThenCarPositionIsThree [
	
	| aGame |
	aGame := RallyGame players: 'Juan' gear: {LoadedDie sequence: #(2)} boardLength: 5.
	
	aGame advance.
	
	
	self assert: (aGame positionOf: 'Juan') equals: 3.

	
	
	
	
	
]

{ #category : #tests }
RallyGameTest >> test06WhenGameStartsThenCarsAreInPositionOne [
	
	| aGame |
	aGame := RallyGame players: 'Juan' gear: {LoadedDie sequence: #(2)} boardLength: 5.
	
	
	self assert: (aGame positionOf: 'Juan') equals: 1.

	
	
	
	
	
]

{ #category : #tests }
RallyGameTest >> test07WhenCarShiftUpGearThenAdvanceWillUseTheSecondLoadedDie [
	
	| aGame gear |
	gear := { LoadedDie sequence: #(2) . LoadedDie sequence: #(3)}.
	
	aGame := RallyGame players: 'Juan' gear: gear  boardLength: 5.
	aGame shiftUpGear.
	
	aGame advance .
	
	
	self assert: (aGame positionOf: 'Juan') equals: 4.

	
	
	
	
	
]
