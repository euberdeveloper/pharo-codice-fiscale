Class {
	#name : #TestCodiceFiscale,
	#superclass : #TestCase,
	#category : #CodiceFiscale
}

{ #category : #tests }
TestCodiceFiscale >> testGetRelevantLettersFromName [
			
	| result tests |
	
	tests := {
		{ #name -> 'EUGENIO' . #vowels -> 'EUEIO' . #consonants -> 'GN' . #maxConsonants -> 4 } asDictionary.
		{ #name -> 'BERRETTA' . #vowels -> 'EE' . #consonants -> 'BRRT' . #maxConsonants -> 4 } asDictionary.
		{ #name -> 'EEE' . #vowels -> 'EEE' . #consonants -> '' . #maxConsonants -> 4 } asDictionary.
		{ #name -> 'XXX' . #vowels -> '' . #consonants -> 'XXX' . #maxConsonants -> 4 } asDictionary.
		{ #name -> '' . #vowels -> '' . #consonants -> '' . #maxConsonants -> 4 } asDictionary.
		{ #name -> 'PQRSTE' . #vowels -> '' . #consonants -> 'PQRS' . #maxConsonants -> 4 } asDictionary.
		{ #name -> 'BERRETTA' . #vowels -> 'E' . #consonants -> 'BRR' . #maxConsonants -> 3 } asDictionary.
		{ #name -> 'BERRETTA' . #vowels -> 'EEA' . #consonants -> 'BRRTT' . #maxConsonants -> 10 } asDictionary.
		{ #name -> 'BERRETTA' . #vowels -> '' . #consonants -> 'B' . #maxConsonants -> 1 } asDictionary
	}.
	
	"TODO: change type of error"
	self
		should: [ CodiceFiscale  getRelevantLettersFromName: 'asfd' withMaxConsonants: 0 ]
		raise: Error.
		
	tests do: [ :test |
		result := CodiceFiscale getRelevantLettersFromName: (test at: #name) withMaxConsonants: (test at: #maxConsonants).
		self assert: ((result at: #vowels) hasEqualElements: (test at: #vowels)).
		self assert: ((result at: #consonants) hasEqualElements: (test at: #consonants)).
	]
	
	
	
]
