Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'min',
		'max'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Die class >> min: aMin max: aMax [

	^ self new initializeWith: aMin max: aMax
]

{ #category : #initialization }
Die >> initializeWith: aMin max: aMax [

	min := aMin.
	max := aMax
]

{ #category : #initialization }
Die >> throw [ 

	^(min to: max) atRandom .
]
