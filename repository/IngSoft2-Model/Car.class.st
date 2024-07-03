Class {
	#name : #Car,
	#superclass : #Object,
	#instVars : [
		'gear',
		'name',
		'currentGear'
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

{ #category : #'as yet unclassified' }
Car >> currentGear [
	^ currentGear  

]

{ #category : #initialization }
Car >> initializeWith: aName gear: aGear [

	name := aName.
	gear := aGear.
	currentGear := 1
]

{ #category : #'as yet unclassified' }
Car >> moveIn: aBoard [

	| dieNumber position |
	dieNumber := (gear at: currentGear) throw .
	position := aBoard  indexOf: self.

	aBoard at: position put: nil.
	aBoard at: position + dieNumber put: self.

	 
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
