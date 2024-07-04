Class {
	#name : #LoadedSquareGenerator,
	#superclass : #Object,
	#instVars : [
		'squareToCreate'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
LoadedSquareGenerator class >> with: aSquare [
	
	^ self new initializeWith: aSquare 
]

{ #category : #translating }
LoadedSquareGenerator >> generate [ 
	
	^ squareToCreate deepCopy .
]

{ #category : #translating }
LoadedSquareGenerator >> generate: anAmountOfSquares [ 
	
	^ squareToCreate value.
]

{ #category : #translating }
LoadedSquareGenerator >> initializeWith: aSquare [

	squareToCreate := aSquare 
	
	

	
]
