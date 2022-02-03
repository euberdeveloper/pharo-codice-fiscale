Class {
	#name : #CodiceFiscaleUtilities,
	#superclass : #Object,
	#category : #CodiceFiscaleUtilities
}

{ #category : #'helper methods' }
CodiceFiscaleUtilities class >> arraySwap: arr element: x with: y [
	"A method that swaps the two elements of an array or fails silently if the elemens do not exist"
			
	| temp |
	[
		temp := arr at: x.
		arr at: x put: (arr at: y).
		arr at: y put: temp. 
	] on: Error do: [ ^self ].
]
