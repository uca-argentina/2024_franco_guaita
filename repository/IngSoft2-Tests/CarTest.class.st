Class {
	#name : #CarTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CarTest >> should: anErrorBlock raise: exceptionClass withMessage: anErrorMessage [ 

    self
        should: anErrorBlock
        raise: exceptionClass
        withExceptionDo: [ :error |
        self assert: error messageText equals: anErrorMessage ]

]

{ #category : #tests }
CarTest >> test01whenGearIsZeroAndShiftUpGearThenCurrentGearIsOne [
	| aCar |
	aCar := Car new.
	aCar shiftUpGear.
	
	self assert: aCar currentGear equals: 1.
]

{ #category : #tests }
CarTest >> test02whenGearIsZeroAndShiftUpGearTwiceThenCurrentGearIsTwo [
	| aCar |
	aCar := Car new.
	aCar shiftUpGear.
	aCar shiftUpGear.
	
	self assert: aCar currentGear equals: 2.
]

{ #category : #tests }
CarTest >> test03ErrorWhenGearIsFiveAndShiftUpGear [

	| aCar |
	aCar := Car new.
	aCar shiftUpGear.
	aCar shiftUpGear.
	aCar shiftUpGear.
	aCar shiftUpGear.
	aCar shiftUpGear.

	self
		should: [ aCar shiftUpGear ]
		raise: Error
		withMessage: 'Cannot Shift Up In Gear Five'
]
