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

{ #category : #'helper methods' }
CodiceFiscaleUtilities class >> padInteger: n with: pad [
	"A method that given an integer and a pad, returns a string of length pad representing the integer with leading zeros"
			
	| result |

	result := n asString.
	[ result size < pad ] whileTrue: [ 
		result := '0', result.
	].

	^result.
]
