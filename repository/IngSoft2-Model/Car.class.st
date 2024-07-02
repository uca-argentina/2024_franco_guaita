Class {
	#name : #Car,
	#superclass : #Object,
	#instVars : [
		'gear',
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
Car class >> name: aName [

	^ self new initializeWith: aName.
]

{ #category : #'as yet unclassified' }
Car >> currentGear [
	^ gear 

]

{ #category : #'as yet unclassified' }
Car >> initializeWith: aName [
	 name := aName .
	gear := 1.
]

{ #category : #'as yet unclassified' }
Car >> name [ 

	^ name.
]

{ #category : #'as yet unclassified' }
Car >> shiftDownGear [

	gear = 1 ifTrue: [ Error signal: 'Cannot Shift Down In Gear One' ].

	gear := gear - 1
]

{ #category : #'as yet unclassified' }
Car >> shiftUpGear [

	gear = 5 ifTrue: [ Error signal: 'Cannot Shift Up In Gear Five' ].
	gear := gear + 1
]
