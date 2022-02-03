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

{ #category : #helpers }
CodiceFiscale class >> handleName: text [
	"A method that given a name returns the letters that will be put in the CF"	
			
	| result relevantLetters consonants vowels |
	
	relevantLetters := self getRelevantLettersFromName: text withMaxConsonants: 4.
	
	consonants := relevantLetters at: #consonants.
	vowels := relevantLetters at: #vowels.
	
	CodiceFiscaleUtilities arraySwap: consonants element: 3 with: 4.
	
	consonants size > 3
		ifTrue: [ result := consonants copyFrom: 1 to: 3 ]
		ifFalse: [ result := consonants ].
		
	[ result size < 3 and: vowels isNotEmpty ] whileTrue: [ 
		result add: (vowels at: 1).
		vowels removeFirst.
	].

	[ result size < 3 ] whileTrue: [ 
		result add: $X.
	].

	^(String newFrom: result).


	
]

{ #category : #helpers }
CodiceFiscale class >> handleSurname: text [
	"A method that given a surname returns the letters that will be put in the CF"	
			
	| result relevantLetters consonants vowels |
	
	relevantLetters := self getRelevantLettersFromName: text withMaxConsonants: 3.
	
	consonants := relevantLetters at: #consonants.
	vowels := relevantLetters at: #vowels.
	
	result := consonants.
	
	[ result size < 3 and: vowels isNotEmpty ] whileTrue: [ 
		result add: (vowels at: 1).
		vowels removeFirst.
	].

	[ result size < 3 ] whileTrue: [ 
		result add: $X.
	].

	^(String newFrom: result).


	
]
