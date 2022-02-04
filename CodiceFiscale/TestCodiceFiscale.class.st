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
TestCodiceFiscale >> testHandleDateOfBirthAndSex [
			
	| result tests |
	
	tests := {
		{ #date -> (Date year: 1999 month: 4 day: 23) . #sex -> CodiceFiscaleMale . #expected -> '99D23' } asDictionary.
		{ #date -> (Date year: 1956 month: 7 day: 5) . #sex -> CodiceFiscaleMale . #expected -> '56L05' } asDictionary.
	}.
		
	tests do: [ :test |
		result := CodiceFiscale handleDateOfBirth: (test at: #date) andSex: (test at: #sex).
		self assert: result equals: (test at: #expected).
	]
	
	
	
]

{ #category : #tests }
TestCodiceFiscale >> testHandleDayAndSex [
			
	| result date tests |
	
	tests := {
		{ #day -> 1 . #sex -> CodiceFiscaleMale . #expected -> '01' } asDictionary.
		{ #day -> 3 . #sex -> CodiceFiscaleMale . #expected -> '03' } asDictionary.
		{ #day -> 5 . #sex -> CodiceFiscaleMale . #expected -> '05' } asDictionary.
		{ #day -> 11 . #sex -> CodiceFiscaleMale . #expected -> '11' } asDictionary.
		{ #day -> 23 . #sex -> CodiceFiscaleMale . #expected -> '23' } asDictionary.
		{ #day -> 30 . #sex -> CodiceFiscaleMale . #expected -> '30' } asDictionary.
		
		{ #day -> 1 . #sex -> CodiceFiscaleFemale . #expected -> '41' } asDictionary.
		{ #day -> 3 . #sex -> CodiceFiscaleFemale . #expected -> '43' } asDictionary.
		{ #day -> 5 . #sex -> CodiceFiscaleFemale . #expected -> '45' } asDictionary.
		{ #day -> 11 . #sex -> CodiceFiscaleFemale . #expected -> '51' } asDictionary.
		{ #day -> 23 . #sex -> CodiceFiscaleFemale . #expected -> '63' } asDictionary.
		{ #day -> 30 . #sex -> CodiceFiscaleFemale . #expected -> '70' } asDictionary.
	}.
		
	tests do: [ :test |
		date := Date year: 1999 asInteger month: 1 day: (test at: #day).
		result := CodiceFiscale handleDay: date andSex: (test at: #sex).
		self assert: result equals: (test at: #expected).
	]
	
	
	
]

{ #category : #tests }
TestCodiceFiscale >> testHandleMonth [
			
	| result date tests |
	
	tests := {
		{ #month -> 1 . #expected -> 'A' } asDictionary.
		{ #month -> 2 . #expected -> 'B' } asDictionary.
		{ #month -> 3 . #expected -> 'C' } asDictionary.
		{ #month -> 4 . #expected -> 'D' } asDictionary.
		{ #month -> 5 . #expected -> 'E' } asDictionary.
		{ #month -> 6 . #expected -> 'H' } asDictionary.
		{ #month -> 7 . #expected -> 'L' } asDictionary.
		{ #month -> 8 . #expected -> 'M' } asDictionary.
		{ #month -> 9 . #expected -> 'P' } asDictionary.
		{ #month -> 10 . #expected -> 'R' } asDictionary.
		{ #month -> 11 . #expected -> 'S' } asDictionary.
		{ #month -> 12 . #expected -> 'T' } asDictionary.
	}.
		
	tests do: [ :test |
		date := Date year: 1999 asInteger month: (test at: #month) day: 1.
		result := CodiceFiscale handleMonth: date.
		self assert: result equals: (test at: #expected).
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

{ #category : #tests }
TestCodiceFiscale >> testHandleYear [
			
	| result date tests |
	
	tests := {
		{ #year -> '1999' . #expected -> '99' } asDictionary.
		{ #year -> '2000' . #expected -> '00' } asDictionary.
		{ #year -> '3000' . #expected -> '00' } asDictionary.
		{ #year -> '1956' . #expected -> '56' } asDictionary.
		{ #year -> '1963' . #expected -> '63' } asDictionary.
		{ #year -> '1991' . #expected -> '91' } asDictionary.
		{ #year -> '101' . #expected -> '01' } asDictionary
	}.
		
	tests do: [ :test |
		date := Date year: (test at: #year) asInteger month: 1 day: 1.
		result := CodiceFiscale handleYear: date.
		self assert: result equals: (test at: #expected).
	]
	
	
	
]
