Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DieTest >> test01ThrowADieWithSixFacesThenNumberIsBetweenOneAndSix [ 

	| aDie |
	aDie := (Die min: 1 max: 6).
	self assert: (aDie throw between: 1 and: 6) .
]
