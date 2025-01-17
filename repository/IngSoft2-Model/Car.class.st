Class {
	#name : #Car,
	#superclass : #Object,
	#instVars : [
		'gear',
		'name',
		'currentGear',
		'shouldLoseTurn',
		'tires',
		'turnsInCurve'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Car class >> name: aName gear: aGear [

	^ self new initializeWith: aName gear: aGear
]

{ #category : #adding }
Car >> addTurnInCurve [

	turnsInCurve := turnsInCurve + 1
]

{ #category : #testing }
Car >> canPlay [

	^ shouldLoseTurn not and: tires > 0
]

{ #category : #'as yet unclassified' }
Car >> currentGear [

	^ currentGear
]

{ #category : #'as yet unclassified' }
Car >> curveLeft [

	turnsInCurve := 0
]

{ #category : #initialization }
Car >> initializeWith: aName gear: aGear [

	name := aName.
	gear := aGear.
	currentGear := 1.
	shouldLoseTurn := false.
	tires := 3.
	turnsInCurve := 0
]

{ #category : #'as yet unclassified' }
Car >> loseTire [

	tires := tires - 1
]

{ #category : #'as yet unclassified' }
Car >> loseTurn [

	shouldLoseTurn := true
]

{ #category : #'as yet unclassified' }
Car >> moveIn: aBoard [

	| dieNumber |
	dieNumber := (gear at: currentGear) throw.
	aBoard move: self by: dieNumber
]

{ #category : #'as yet unclassified' }
Car >> name [

	^ name
]

{ #category : #'as yet unclassified' }
Car >> noTiresLeft [

	^ tires = 0
]

{ #category : #'as yet unclassified' }
Car >> shiftDownGear [

	currentGear = 1 ifTrue: [
		Error signal: 'Cannot Shift Down In Gear One' ].
	currentGear := currentGear - 1
]

{ #category : #'as yet unclassified' }
Car >> shiftUpGear [

	currentGear = 5 ifTrue: [
		Error signal: 'Cannot Shift Up In Gear Five' ].
	currentGear := currentGear + 1
]

{ #category : #'as yet unclassified' }
Car >> tires [

	^ tires
]

{ #category : #'as yet unclassified' }
Car >> tryShiftDownGear [

	currentGear = 1 ifFalse: [ currentGear := currentGear - 1 ]
]

{ #category : #'as yet unclassified' }
Car >> turnLost [

	shouldLoseTurn := false
]

{ #category : #accessing }
Car >> turnsInCurve [

	^ turnsInCurve
]
