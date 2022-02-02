Class {
	#name : #TestCodiceFiscale,
	#superclass : #TestCase,
	#category : #CodiceFiscale
}

{ #category : #tests }
TestCodiceFiscale >> testGetRelevantLettersFromName [
			
	| result tests |
	
	tests := {
		{ #name -> 'EUGENIO' . #vowels -> 'EUEIO' . #consonants -> 'GN' } asDictionary.
		{ #name -> 'BERRETTA' . #vowels -> 'EE' . #consonants -> 'BRRT' } asDictionary.
		{ #name -> 'EEE' . #vowels -> 'EEE' . #consonants -> '' } asDictionary.
		{ #name -> 'XXX' . #vowels -> '' . #consonants -> 'XXX' } asDictionary.
		{ #name -> '' . #vowels -> '' . #consonants -> '' } asDictionary.
		{ #name -> 'PQRSTE' . #vowels -> '' . #consonants -> 'PQRS' } asDictionary
	}.
		
	tests do: [ :test |
		result := CodiceFiscale getRelevantLettersFromName: (test at: #name).
		self assert: ((result at: #vowels) hasEqualElements: (test at: #vowels)).
		self assert: ((result at: #consonants) hasEqualElements: (test at: #consonants)).
	]
	
	
	
]
