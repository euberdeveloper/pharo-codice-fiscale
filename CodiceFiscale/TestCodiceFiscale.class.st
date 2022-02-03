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

{ #category : #tests }
TestCodiceFiscale >> testHandleName [
			
	| result tests |
	
	tests := {
		{ #name -> 'EUGENIO' . #expected -> 'GNE' } asDictionary.
		{ #name -> 'RUGGERO' . #expected -> 'RGR' } asDictionary.
		{ #name -> 'CARLO' . #expected -> 'CRL' } asDictionary.
		{ #name -> 'TEO' . #expected -> 'TEO' } asDictionary.
		{ #name -> 'EOT' . #expected -> 'TEO' } asDictionary.
		{ #name -> 'F' . #expected -> 'FXX' } asDictionary.
		{ #name -> 'E' . #expected -> 'EXX' } asDictionary
	}.
		
	tests do: [ :test |
		result := CodiceFiscale handleName: (test at: #name).
		self assert: result equals: (test at: #expected).
	]
	
	
	
]

{ #category : #tests }
TestCodiceFiscale >> testHandleSurname [
			
	| result tests |
	
	tests := {
		{ #surname -> 'BERRETTA' . #expected -> 'BRR' } asDictionary.
		{ #surname -> 'CARLO' . #expected -> 'CRL' } asDictionary.
		{ #surname -> 'TEO' . #expected -> 'TEO' } asDictionary.
		{ #surname -> 'EOT' . #expected -> 'TEO' } asDictionary.
		{ #surname -> 'F' . #expected -> 'FXX' } asDictionary.
		{ #surname -> 'E' . #expected -> 'EXX' } asDictionary
	}.
		
	tests do: [ :test |
		result := CodiceFiscale handleSurname: (test at: #surname).
		self assert: result equals: (test at: #expected).
	]
	
	
	
]
