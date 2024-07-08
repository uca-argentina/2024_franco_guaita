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

	| aGame squareGenerator |
	squareGenerator := LoadedSquareGenerator withSquares:
		                   { PavementSquare new } asOrderedCollection.
	aGame := RallyGame
		         players: { 'Juan' } asOrderedCollection
		         gear: { (LoadedDie sequence: #( 1 )) }
		         boardLength: 5
		         generator: squareGenerator
		         curves: OrderedCollection new.

	aGame advance.

	self assert: (aGame positionOf: 'Juan') equals: 2
]

{ #category : #tests }
RallyGameTest >> test02WhenPositionOfPlayerIsFiveThenPlayerWinsTheGame [

	| aGame squareGenerator |
	squareGenerator := LoadedSquareGenerator withSquares:  { PavementSquare new } asOrderedCollection .
	aGame := RallyGame
		         players: { 'Juan' } asOrderedCollection
		         gear: { (LoadedDie sequence: #( 1 )) }
		         boardLength: 5
		         generator: squareGenerator
		         curves: OrderedCollection new.

	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.

	self assert: (aGame positionOf: 'Juan') equals: 5.
	self assert: aGame winner equals: 'Juan'
]

{ #category : #tests }
RallyGameTest >> test03ErrorWhenPositionOfPlayerIsFiveThenPlayerCannotPlayTurn [
	
	| aGame squareGenerator |
	squareGenerator := LoadedSquareGenerator withSquares:  { PavementSquare new } asOrderedCollection .
	aGame := RallyGame
		         players: { 'Juan' } asOrderedCollection
		         gear: { (LoadedDie sequence: #( 1 )) }
		         boardLength: 5
		         generator: squareGenerator
		         curves: OrderedCollection new.
	
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
	
	| aGame squareGenerator |
	squareGenerator := LoadedSquareGenerator withSquares:  { PavementSquare new } asOrderedCollection .
	aGame := RallyGame
		         players: { 'Juan' } asOrderedCollection
		         gear: { (LoadedDie sequence: #( 1 )) }
		         boardLength: 5
		         generator: squareGenerator
		         curves: OrderedCollection new.
	
	
	self
		should: [ aGame winner]
		raise: Error
		withMessage: 'Theres no winner yet'
	
	
	
	
	
]

{ #category : #tests }
RallyGameTest >> test05WhenDieThrowsTwoThenCarPositionIsThree [

	| aGame squareGenerator |
	squareGenerator := LoadedSquareGenerator withSquares:  { PavementSquare new } asOrderedCollection .
	aGame := RallyGame
		         players: { 'Juan' } asOrderedCollection
		         gear: { (LoadedDie sequence: #( 2 )) }
		         boardLength: 5
		        generator: squareGenerator
		         curves: OrderedCollection new.

	aGame advance.


	self assert: (aGame positionOf: 'Juan') equals: 3
]

{ #category : #tests }
RallyGameTest >> test06WhenGameStartsThenCarsAreInPositionOne [
	
	| aGame squareGenerator |
	squareGenerator := LoadedSquareGenerator withSquares:  { PavementSquare new } asOrderedCollection .
	aGame := RallyGame
		         players: { 'Juan' } asOrderedCollection
		         gear: { (LoadedDie sequence: #( 2 )) }
		         boardLength: 5
		         generator: squareGenerator
		         curves: OrderedCollection new.
	
	
	self assert: (aGame positionOf: 'Juan') equals: 1.

	
	
	
	
	
]

{ #category : #tests }
RallyGameTest >> test07WhenCarShiftUpGearThenAdvanceWillUseTheSecondLoadedDie [

	| aGame gear squareGenerator |
	gear := {
		        (LoadedDie sequence: #( 2 )).
		        (LoadedDie sequence: #( 3 )) }.

	squareGenerator := LoadedSquareGenerator withSquares:
		                   { PavementSquare new } asOrderedCollection.
	aGame := RallyGame
		         players: { 'Juan' } asOrderedCollection
		         gear: gear
		         boardLength: 5
		         generator: squareGenerator
		         curves: OrderedCollection new.
		
	aGame shiftUpGear.

	aGame advance.


	self assert: (aGame positionOf: 'Juan') equals: 4
]

{ #category : #tests }
RallyGameTest >> test08WhenTwoPlayersAdvanceThenBothPlayersAreInPositionThree [

	| aGame gear nameCollection squareGenerator |
	nameCollection := OrderedCollection with: 'Juan' with: 'Agus'.
	gear := {
		        (LoadedDie sequence: #( 2 )).
		        (LoadedDie sequence: #( 3 )) }.

	squareGenerator := LoadedSquareGenerator withSquares:
		                   { PavementSquare new } asOrderedCollection.
	aGame := RallyGame
		         players: nameCollection
		         gear: gear
		         boardLength: 5
		         generator: squareGenerator
		         curves: OrderedCollection new.

	aGame advance.
	aGame advance.

	self assert: (aGame positionOf: 'Juan') equals: 3.
	self assert: (aGame positionOf: 'Agus') equals: 3
]

{ #category : #tests }
RallyGameTest >> test09WhenTwoPlayersPlayTwoDifferentTurnsThenPositionsShouldBeDifferent [

	| aGame gear nameCollection squareGenerator |
	nameCollection := OrderedCollection with: 'Juan' with: 'Agus'.
	gear := {
		        (LoadedDie sequence: #( 2 )).
		        (LoadedDie sequence: #( 3 )) }.

	squareGenerator := LoadedSquareGenerator withSquares:
		                   { PavementSquare new } asOrderedCollection.
	aGame := RallyGame
		         players: nameCollection
		         gear: gear
		         boardLength: 10
		         generator: squareGenerator
		         curves: OrderedCollection new.

	aGame shiftUpGear.
	aGame advance.
	aGame advance.
	aGame advance.

	self assert: (aGame positionOf: 'Juan') equals: 4.
	self assert: (aGame positionOf: 'Agus') equals: 5
]

{ #category : #tests }
RallyGameTest >> test10WhenCarLandsInRubberSquareThenPositionIsCurrentPlusTwo [

	| aGame gear nameCollection squareGenerator |
	nameCollection := OrderedCollection with: 'Juan' with: 'Agus'.
	gear := {
		        (LoadedDie sequence: #( 2 )).
		        (LoadedDie sequence: #( 3 )) }.

	squareGenerator := LoadedSquareGenerator withSquares:
		                   { RubberSquare new } asOrderedCollection.
	aGame := RallyGame
		         players: nameCollection
		         gear: gear
		         boardLength: 10
		         generator: squareGenerator
		         curves: OrderedCollection new.

	aGame shiftUpGear.
	aGame advance.

	self assert: (aGame positionOf: 'Juan') equals: 1.
	self assert: (aGame positionOf: 'Agus') equals: 5
]

{ #category : #tests }
RallyGameTest >> test11WhenACarLandsInOilSquareThenCarShouldLoseNextTurn [

	| aGame gear nameCollection squareGenerator someSquares |
	someSquares := OrderedCollection
		               with: PavementSquare new
		               with: OilSquare new
		               with: PavementSquare new
		               with: PavementSquare new
		               with: PavementSquare new.

	nameCollection := OrderedCollection with: 'Juan' with: 'Agus'.
	gear := {
		        (LoadedDie sequence: #( 1 2 1 )).
		        (LoadedDie sequence: #( 3 )) }.

	squareGenerator := LoadedSquareGenerator withSquares: someSquares.
	aGame := RallyGame
		         players: nameCollection
		         gear: gear
		         boardLength: 10
		         generator: squareGenerator
		         curves: OrderedCollection new.

	aGame advance.
	aGame advance.
	aGame advance.

	self assert: (aGame positionOf: 'Juan') equals: 2.
	self assert: (aGame positionOf: 'Agus') equals: 4
]

{ #category : #tests }
RallyGameTest >> test12WhenCarLoseATurnThenAfterTurnLostCarShouldBeAbleToPlay [

	| aGame gear nameCollection squareGenerator someSquares |
	someSquares := OrderedCollection
		               with: PavementSquare new
		               with: OilSquare new
		               with: PavementSquare new
		               with: PavementSquare new
		               with: PavementSquare new.

	nameCollection := OrderedCollection with: 'Juan' with: 'Agus'.
	gear := {
		        (LoadedDie sequence: #( 1 2 1 1 )).
		        (LoadedDie sequence: #( 3 )) }.

	squareGenerator := LoadedSquareGenerator withSquares: someSquares.
	aGame := RallyGame
		         players: nameCollection
		         gear: gear
		         boardLength: 10
		         generator: squareGenerator
		         curves: OrderedCollection new.

	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.

	self assert: (aGame positionOf: 'Juan') equals: 3.
	self assert: (aGame positionOf: 'Agus') equals: 4
]

{ #category : #tests }
RallyGameTest >> test13WhenCarLandsInOilSquareThenCarShouldReduceGearInOne [

	| aGame gear nameCollection squareGenerator someSquares |
	someSquares := OrderedCollection
		               with: PavementSquare new
		               with: OilSquare new
		               with: PavementSquare new
		               with: PavementSquare new
		               with: PavementSquare new.

	nameCollection := OrderedCollection with: 'Juan' with: 'Agus'.
	gear := {
		        (LoadedDie sequence: #( 3 )).
		        (LoadedDie sequence: #( 1 2 1 1 )) }.

	squareGenerator := LoadedSquareGenerator withSquares: someSquares.
	aGame := RallyGame
		         players: nameCollection
		         gear: gear
		         boardLength: 10
		         generator: squareGenerator
		         curves: OrderedCollection new.

	aGame shiftUpGear.
	aGame shiftUpGear.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.

	self assert: (aGame positionOf: 'Juan') equals: 5.
	self assert: (aGame positionOf: 'Agus') equals: 4
]

{ #category : #tests }
RallyGameTest >> test14WhenGameStartsAllCarsShouldHaveThreeTires [

	| aGame gear nameCollection squareGenerator someSquares |
	someSquares := OrderedCollection with: PavementSquare new.


	nameCollection := OrderedCollection with: 'Juan' with: 'Agus'.
	gear := {
		        (LoadedDie sequence: #( 6 )).
		        (LoadedDie sequence: #( 1 2 1 1 )) }.

	squareGenerator := LoadedSquareGenerator withSquares: someSquares.
	aGame := RallyGame
		         players: nameCollection
		         gear: gear
		         boardLength: 20
		         generator: squareGenerator
		         curves: OrderedCollection new.

	self assert: (aGame tiresOf: 'Juan') equals: 3.
	self assert: (aGame tiresOf: 'Agus') equals: 3
]

{ #category : #tests }
RallyGameTest >> test15WhenACarGoesThroughAWholeCurveInOneTurnThenCarLoseOneTire [

	| aGame gear nameCollection squareGenerator someSquares someCurves |
	someSquares := OrderedCollection with: PavementSquare new.

	someCurves := OrderedCollection  with: (Curve start: 2 end: 6 difficulty: 1).

	nameCollection := OrderedCollection with: 'Juan'.
	gear := {
		        (LoadedDie sequence: #( 6 )).
		        (LoadedDie sequence: #( 1 2 1 1 )) }.

	squareGenerator := LoadedSquareGenerator withSquares: someSquares.
	aGame := RallyGame
		         players: nameCollection
		         gear: gear
		         boardLength: 20
		         generator: squareGenerator
		         curves: someCurves.

	"Curva de 2 a 6 y dificultad 1"
	aGame advance.


	self assert: (aGame positionOf: 'Juan') equals: 7.
	self assert: (aGame tiresOf: 'Juan') equals: 2
]

{ #category : #tests }
RallyGameTest >> test16WhenACarEntersInDifficultyOneCurveThenCarShouldLeaveTheCurveWithThreeTires [

	| aGame gear nameCollection squareGenerator someSquares someCurves |
	someSquares := OrderedCollection with: PavementSquare new.


	nameCollection := OrderedCollection with: 'Juan'.
	gear := {
		        (LoadedDie sequence: #( 3 )).
		        (LoadedDie sequence: #( 1 2 1 1 )) }.
		
	someCurves := OrderedCollection  with: (Curve start: 2 end: 6 difficulty: 1) .

	squareGenerator := LoadedSquareGenerator withSquares: someSquares.
	aGame := RallyGame
		         players: nameCollection
		         gear: gear
		         boardLength: 20
		         generator: squareGenerator
		         curves: someCurves.



	"Curva de 2 a 6 y dificultad 1"
	aGame advance.
	aGame advance.


	self assert: (aGame positionOf: 'Juan') equals: 7.
	self assert: (aGame tiresOf: 'Juan') equals: 3
]

{ #category : #tests }
RallyGameTest >> test17WhenACarIsOnlyOneTurnOnADifficultyTwoCurveThenCarLoseOneTire [

	| aGame gear nameCollection squareGenerator someSquares someCurves |
	someSquares := OrderedCollection with: PavementSquare new.



	nameCollection := OrderedCollection with: 'Juan'.
	gear := {
		        (LoadedDie sequence: #( 3 )).
		        (LoadedDie sequence: #( 1 2 1 1 )) }.

	someCurves := OrderedCollection with:
		              (Curve start: 2 end: 6 difficulty: 2).

	squareGenerator := LoadedSquareGenerator withSquares: someSquares.
	aGame := RallyGame
		         players: nameCollection
		         gear: gear
		         boardLength: 20
		         generator: squareGenerator
		         curves: someCurves.

	"Curva de 2 a 6 y dificultad 2"

	aGame advance.
	aGame advance.

	self assert: (aGame positionOf: 'Juan') equals: 7.
	self assert: (aGame tiresOf: 'Juan') equals: 2
]

{ #category : #tests }
RallyGameTest >> test18WhenCarEntersADifficultyTwoCurveAndLeavesCurveDueToAnSquareEffectThenCarLoseOneTire [

	| aGame gear nameCollection squareGenerator someSquares someCurves |
	someSquares := OrderedCollection with: PavementSquare new
		               with: PavementSquare new
		               with: PavementSquare new
		               with: PavementSquare new
		               with: PavementSquare new
		               with: PavementSquare new.
	
	someSquares add: RubberSquare new.
	someSquares add: PavementSquare  new.
	someSquares add: PavementSquare  new.
	someSquares add: PavementSquare  new.

	nameCollection := OrderedCollection with: 'Juan'.
	gear := {
		        (LoadedDie sequence: #( 6 )).
		        (LoadedDie sequence: #( 1 2 1 1 )) }.

	someCurves := OrderedCollection with:
		              (Curve start: 2 end: 8 difficulty: 2).

	squareGenerator := LoadedSquareGenerator withSquares: someSquares.
	aGame := RallyGame
		         players: nameCollection
		         gear: gear
		         boardLength: 20
		         generator: squareGenerator
		         curves: someCurves.

	"Curva de 2 a 6 y dificultad 2"

	aGame advance.

	self assert: (aGame positionOf: 'Juan') equals: 9.
	self assert: (aGame tiresOf: 'Juan') equals: 2
]

{ #category : #tests }
RallyGameTest >> test19WhenCarEntersADifficultyTwoCurveAndLeavesCurveDueToAnSquareEffectAfterTwoTurnsThenCarDoesNotLoseTire [

	| aGame gear nameCollection squareGenerator someSquares someCurves |
	someSquares := OrderedCollection with: PavementSquare new
		               with: PavementSquare new
		               with: PavementSquare new
		               with: PavementSquare new
		               with: PavementSquare new
		               with: PavementSquare new.
	
	someSquares add: RubberSquare new.
	someSquares add: PavementSquare  new.
	someSquares add: PavementSquare  new.
	someSquares add: PavementSquare  new.

	nameCollection := OrderedCollection with: 'Juan'.
	gear := {
		        (LoadedDie sequence: #( 2 )).
		        (LoadedDie sequence: #( 1 2 1 1 )) }.

	someCurves := OrderedCollection with:
		              (Curve start: 2 end: 8 difficulty: 2).

	squareGenerator := LoadedSquareGenerator withSquares: someSquares.
	aGame := RallyGame
		         players: nameCollection
		         gear: gear
		         boardLength: 20
		         generator: squareGenerator
		         curves: someCurves.

	aGame advance.
	aGame advance.
	aGame advance.

	self assert: (aGame positionOf: 'Juan') equals: 9.
	self assert: (aGame tiresOf: 'Juan') equals: 3
]

{ #category : #tests }
RallyGameTest >> test20WhenCarPlaysGameAndGoesThroughTwoCurvesWithinTheDifficultyThenCarShouldKeepThreeTires [

	| aGame gear nameCollection squareGenerator someSquares someCurves |
	someSquares := OrderedCollection with: PavementSquare new .
		       

	nameCollection := OrderedCollection with: 'Juan'.
	gear := {
		        (LoadedDie sequence: #( 2 3 3 4 4)).
		        (LoadedDie sequence: #( 1 2 1 1 )) }.

	someCurves := OrderedCollection with:
		              (Curve start: 2 end: 8 difficulty: 2)
		with:
		              (Curve start: 12 end: 16 difficulty: 1).

	squareGenerator := LoadedSquareGenerator withSquares: someSquares.
	aGame := RallyGame
		         players: nameCollection
		         gear: gear
		         boardLength: 30
		         generator: squareGenerator
		         curves: someCurves.

	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.

	self assert: (aGame positionOf: 'Juan') equals: 17.
	self assert: (aGame tiresOf: 'Juan') equals: 3
]

{ #category : #tests }
RallyGameTest >> test21WhenACarLosesThreeTiresThenGameEndsForThatCar [

	| aGame gear nameCollection squareGenerator someSquares someCurves |
	someSquares := OrderedCollection with: PavementSquare new.


	nameCollection := OrderedCollection with: 'Juan'.
	gear := {
		        (LoadedDie sequence: #( 2 3 3 4 4 5)).
		        (LoadedDie sequence: #( 1 2 1 1 )) }.

	someCurves := OrderedCollection
		              with: (Curve start: 2 end: 8 difficulty: 3)
		              with: (Curve start: 12 end: 16 difficulty: 2)
		              with: (Curve start: 18 end: 20 difficulty: 1).

	squareGenerator := LoadedSquareGenerator withSquares: someSquares.
	aGame := RallyGame
		         players: nameCollection
		         gear: gear
		         boardLength: 30
		         generator: squareGenerator
		         curves: someCurves.

	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	

	self assert: (aGame positionOf: 'Juan') equals: 22.
	self assert: (aGame tiresOf: 'Juan') equals: 0.
	self assert: (aGame isOver) 
]

{ #category : #tests }
RallyGameTest >> test22WhenThereAreCarsWithTiresLeftAndOthersWithNoTiresLeftThenGameKeepsGoing [

	| aGame gear nameCollection squareGenerator someSquares someCurves |
	someSquares := OrderedCollection with: PavementSquare new.


	nameCollection := OrderedCollection with: 'Juan' with: 'Agus'.
	gear := {
		        (LoadedDie sequence: #( 2 1 3 1 3 1 4 1 4 1 5 1 1 )).
		        (LoadedDie sequence: #( 1 2 1 1 )) }.

	someCurves := OrderedCollection
		              with: (Curve start: 2 end: 8 difficulty: 3)
		              with: (Curve start: 12 end: 16 difficulty: 2)
		              with: (Curve start: 18 end: 20 difficulty: 1).

	squareGenerator := LoadedSquareGenerator withSquares: someSquares.
	aGame := RallyGame
		         players: nameCollection
		         gear: gear
		         boardLength: 30
		         generator: squareGenerator
		         curves: someCurves.

	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.

	self assert: (aGame positionOf: 'Juan') equals: 22.
	self assert: (aGame positionOf: 'Agus') equals: 8.
	self assert: (aGame tiresOf: 'Juan') equals: 0.
	self deny: aGame isOver
]

{ #category : #tests }
RallyGameTest >> test23WhenAllCarsHaveNoTiresLeftThenWinnerIsTheNearestCarToTheEnd [

	| aGame gear nameCollection squareGenerator someSquares someCurves |
	someSquares := OrderedCollection with: PavementSquare new.


	nameCollection := OrderedCollection with: 'Juan' with: 'Agus'.
	gear := {
		        (LoadedDie sequence: #( 2 2 2 2 2 2 2 2 2 3 3 3 )).
		        (LoadedDie sequence: #( 1 2 1 1 )) }.

	someCurves := OrderedCollection
		              with: (Curve start: 2 end: 4 difficulty: 2)
		              with: (Curve start: 6 end: 8 difficulty: 2)
		              with: (Curve start: 10 end: 13 difficulty: 2).

	squareGenerator := LoadedSquareGenerator withSquares: someSquares.
	aGame := RallyGame
		         players: nameCollection
		         gear: gear
		         boardLength: 30
		         generator: squareGenerator
		         curves: someCurves.

	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.
	aGame advance.

	self assert: (aGame positionOf: 'Juan') equals: 14.
	self assert: (aGame positionOf: 'Agus') equals: 15.
	self assert: (aGame tiresOf: 'Juan') equals: 0.
	self assert: (aGame tiresOf: 'Agus') equals: 0.
	self assert: aGame winner equals: 'Agus'.

	self assert: aGame isOver
]
