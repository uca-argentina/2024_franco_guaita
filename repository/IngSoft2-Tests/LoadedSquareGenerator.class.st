Class {
	#name : #LoadedSquareGenerator,
	#superclass : #Object,
	#instVars : [
		'squares'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'as yet unclassified' }
LoadedSquareGenerator class >> withSquares: someSquares [

	^ self new initializeWith: someSquares
]

{ #category : #translating }
LoadedSquareGenerator >> generate [

	| square |
	square := squares removeFirst.
	squares add: square.
	^ square deepCopy
]

{ #category : #translating }
LoadedSquareGenerator >> initializeWith: someSquares [

	squares := someSquares  
	
	

	
]
