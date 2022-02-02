Class {
	#name : #CodiceFiscale,
	#superclass : #Object,
	#category : #CodiceFiscale
}

{ #category : #helpers }
CodiceFiscale class >> getRelevantLettersFromName: text withMaxConsonants: maxConsonants [
	"A method that given a name returns an object such as { vowels: [], consonants: [] } with only the relevant letters for the codice fiscale"	
			
	| letters consonants vowels |
	
	maxConsonants <= 0
		ifTrue: [  Error signal: '"maxConsonants" has to be greater than 0' ].
		
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
				consonants size >= maxConsonants
					ifTrue: [ ^letters ]
			].
	].
	
	^letters.
]
