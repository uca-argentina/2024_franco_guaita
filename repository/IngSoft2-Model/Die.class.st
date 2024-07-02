Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Die class >> faces: amountOfFaces [
	^ self new initializeWith: amountOfFaces 
]

{ #category : #initialization }
Die >> initializeWith: amountOfFaces [

	faces := amountOfFaces 
]

{ #category : #initialization }
Die >> throw [ 

	^ faces atRandom .
]
