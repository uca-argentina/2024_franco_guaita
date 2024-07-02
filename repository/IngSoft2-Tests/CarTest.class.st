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
CarTest >> test01WhenGearIsOneAndShiftUpGearThenCurrentGearIsTwo [
	| aCar |
	aCar := Car new.
	aCar shiftUpGear.
	
	self assert: aCar currentGear equals: 2.
]

{ #category : #tests }
CarTest >> test02WhenGearIsOneAndShiftUpGearTwiceThenCurrentGearIsThree [
	| aCar |
	aCar := Car new.
	aCar shiftUpGear.
	aCar shiftUpGear.
	
	self assert: aCar currentGear equals: 3.
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

{ #category : #tests }
CarTest >> test04ErrorWhenGearIsOneAndShiftDownGear [

	| aCar |
	aCar := Car new.
	

	self
		should: [ aCar shiftDownGear ]
		raise: Error
		withMessage: 'Cannot Shift Down In Gear One'
]

{ #category : #tests }
CarTest >> test05WhenGearIsFourAndShiftDownGearTwiceThenCurrentGearIsTwo [
	| aCar |
	aCar := Car new.
	aCar shiftUpGear .
	aCar shiftUpGear .
	aCar shiftUpGear .
	aCar shiftUpGear .
	
	aCar shiftDownGear.
	aCar shiftDownGear.
	
	self assert: aCar currentGear equals: 2.
]
