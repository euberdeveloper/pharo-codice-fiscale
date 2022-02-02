Class {
	#name : #CodiceFiscale,
	#superclass : #Object,
	#category : #CodiceFiscale
}

{ #category : #'helper methods' }
CodiceFiscale >> getRelevantLettersFromName: name [
	"A method that given a name returns an object such as { vowels: [], consonants: [] } with only the relevant letters for the codice fiscale"
			
	| letters vowels consonants |
	vowels := OrderedCollection new.
	consonants := OrderedCollection new.
	
	letters := { 
		#vowels -> vowels,
		#consonants -> consonants 
	}.
	
	^letters.
]
