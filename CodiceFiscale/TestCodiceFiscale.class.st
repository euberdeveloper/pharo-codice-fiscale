Class {
	#name : #TestCodiceFiscale,
	#superclass : #TestCase,
	#category : #CodiceFiscale
}

{ #category : #tests }
TestCodiceFiscale >> testGetRelevantLettersFromName [
			
	| name result |
	name := 'EUGENIO'.
	result := CodiceFiscale getRelevantLettersFromName: name.
	
	self assert: (result at: #vowels) size equals: 5.
	self assert: (result at: #consonants) size equals: 2.
	
]
