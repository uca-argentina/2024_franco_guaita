Class {
	#name : #Car,
	#superclass : #Object,
	#instVars : [
		'gear',
		'name',
		'currentGear',
		'shouldLoseTurn'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
Car class >> name: aName [

	^ self new initializeWith: aName.
]

{ #category : #'as yet unclassified' }
Car class >> name: aName gear: aGear [

	^ self new initializeWith: aName gear: aGear
]

{ #category : #testing }
Car >> canPlay [

	^ shouldLoseTurn not
]

{ #category : #'as yet unclassified' }
Car >> currentGear [
	^ currentGear  

]

{ #category : #initialization }
Car >> initializeWith: aName gear: aGear [

	name := aName.
	gear := aGear.
	currentGear := 1.
	shouldLoseTurn := false
]

{ #category : #'as yet unclassified' }
Car >> loseTurn [

	shouldLoseTurn := true
]

{ #category : #'as yet unclassified' }
Car >> moveIn: aBoard [

	| dieNumber|
	dieNumber := (gear at: currentGear) throw .
	aBoard moveCar: self dieNumber: dieNumber . 

	 
]

{ #category : #'as yet unclassified' }
Car >> name [ 

	^ name.
]

{ #category : #'as yet unclassified' }
Car >> shiftDownGear [

	currentGear = 1 ifTrue: [ Error signal: 'Cannot Shift Down In Gear One' ].

	currentGear := currentGear - 1
]

{ #category : #'as yet unclassified' }
Car >> shiftUpGear [

	currentGear = 5 ifTrue: [ Error signal: 'Cannot Shift Up In Gear Five' ].
	currentGear := currentGear + 1
]

{ #category : #'as yet unclassified' }
Car >> tryShiftDownGear [

	currentGear = 1 ifFalse: [ currentGear := currentGear - 1 ]
]

{ #category : #'as yet unclassified' }
Car >> turnLost [

	shouldLoseTurn := false
]
