Class {
	#name : #Car,
	#superclass : #Object,
	#instVars : [
		'gear'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Car >> currentGear [
	^ gear 

]

{ #category : #'as yet unclassified' }
Car >> initialize [
	gear := 0.

]

{ #category : #'as yet unclassified' }

Car >> shiftDownGear [

	gear = 0 ifTrue: [ Error signal: 'Cannot Shift Down In Gear Zero' ].
	gear := gear - 1
]

{ #category : #'as yet unclassified' }


Car >> shiftUpGear [

	gear = 5 ifTrue: [ Error signal: 'Cannot Shift Up In Gear Five' ].
	gear := gear + 1
]
