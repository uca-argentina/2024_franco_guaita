Class {
	#name : #OilSquare,
	#superclass : #Square,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
OilSquare >> applyEffectTo: aCar in: aBoard [

	aCar loseTurn.
	aCar shiftDownGear
]
