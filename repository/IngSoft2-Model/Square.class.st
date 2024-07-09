Class {
	#name : #Square,
	#superclass : #Object,
	#instVars : [
		'carsIn'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Square >> applyEffectTo: aCar in: aBoard [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Square >> includes: aCar [

	^ carsIn includes: aCar
]

{ #category : #'as yet unclassified' }
Square >> initialize [

	carsIn := OrderedCollection new
]

{ #category : #'as yet unclassified' }
Square >> leaves: aCar [

	carsIn remove: aCar
]

{ #category : #'as yet unclassified' }
Square >> park: aCar [

	carsIn add: aCar
]
