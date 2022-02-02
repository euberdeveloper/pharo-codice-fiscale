Class {
	#name : #CodiceFiscale,
	#superclass : #Object,
	#category : #CodiceFiscale
}

{ #category : #helpers }
CodiceFiscale class >> getRelevantLettersFromName: text [
	"A method that given a name returns an object such as { vowels: [], consonants: [] } with only the relevant letters for the codice fiscale"	
			
	| letters consonants vowels |
		
	consonants := OrderedCollection new.
	vowels := OrderedCollection new.
	
	letters := { 
		#vowels -> vowels.
		#consonants -> consonants
	} asDictionary.	
		
	text do: [ :letter |
		letter isVowel
			ifTrue: [ vowels add: letter ]
			ifFalse: [ 
				consonants add: letter.
				consonants size >= 4
					ifTrue: [ ^letters ]
			].
	].
	
	^letters.
]
