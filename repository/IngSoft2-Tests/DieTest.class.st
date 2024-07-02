Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DieTest >> test01 [ 

	| aDie |
	aDie := Die faces: 6.
	self assert: (aDie throw between: 1 and: 6) .
]
