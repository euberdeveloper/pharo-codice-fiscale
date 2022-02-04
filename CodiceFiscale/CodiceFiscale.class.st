Class {
	#name : #CodiceFiscale,
	#superclass : #Object,
	#category : #CodiceFiscale
}

{ #category : #helpers }
CodiceFiscale class >> calculateControlChar: payload [
	"A method that given the payload, namely the part of the CF without the control char, calculates and returns the control char"	
			
	| remainder |
	
	remainder := 0.
	
	1 to: payload size do: [ :index |
		(index % 2 = 0)
			ifTrue: [ remainder := (remainder + (self getControlCharEqualValue: (payload at: index))) ]
			ifFalse: [ remainder := (remainder + (self getControlCharOddValue: (payload at: index))) ]
	].

	remainder := remainder \\ 26.
	
	^(self getControlRemainderValue: remainder).
]

{ #category : #helpers }
CodiceFiscale class >> getControlCharEqualValue: character [
	"A method that given a character in an equal position, returns the corrisponding value for the calcultion of the control char"	
			
	| mapper |
	
    mapper := { 
        $0 -> 0.
        $1 -> 1.
        $2 -> 2.
        $3 -> 3.
        $4 -> 4.
        $5 -> 5.
        $6 -> 6.
        $7 -> 7.
        $8 -> 8.
        $9 -> 9.
        $A -> 0.
        $B -> 1.
        $C -> 2.
        $D -> 3.
        $E -> 4.
        $F -> 5.
        $G -> 6.
        $H -> 7.
        $I -> 8.
        $J -> 9.
        $K -> 10.
        $L -> 11.
        $M -> 12.
        $N -> 13.
        $O -> 14.
        $P -> 15.
        $Q -> 16.
        $R -> 17.
        $S -> 18.
        $T -> 19.
        $U -> 20.
        $V -> 21.
        $W -> 22.
        $X -> 23.
        $Y -> 24.
        $Z -> 25
    } asDictionary.
	
	^(mapper at: character).
]

{ #category : #helpers }
CodiceFiscale class >> getControlCharOddValue: character [
	"A method that given a character in an odd position, returns the corrisponding value for the calcultion of the control char"	
			
	| mapper |
	
    mapper := { 
        $0 -> 1.
        $1 -> 0.
        $2 -> 5.
        $3 -> 7.
        $4 -> 9.
        $5 -> 13.
        $6 -> 15.
        $7 -> 17.
        $8 -> 19.
        $9 -> 21.
        $A -> 1.
        $B -> 0.
        $C -> 5.
        $D -> 7.
        $E -> 9.
        $F -> 13.
        $G -> 15.
        $H -> 17.
        $I -> 19.
        $J -> 21.
        $K -> 2.
        $L -> 4.
        $M -> 18.
        $N -> 20.
        $O -> 11.
        $P -> 3.
        $Q -> 6.
        $R -> 8.
        $S -> 12.
        $T -> 14.
        $U -> 16.
        $V -> 10.
        $W -> 22.
        $X -> 25.
        $Y -> 24.
        $Z -> 23
    } asDictionary.
	
	^(mapper at: character).
]

{ #category : #helpers }
CodiceFiscale class >> getControlRemainderValue: remainder [
	"A method that given the remainder during the control character calculation results the corrisponding letter"	
			
	| mapper |
	
   mapper := { 
        0 -> 'A'.
        1 -> 'B'.
        2 -> 'C'.
        3 -> 'D'.
        4 -> 'E'.
        5 -> 'F'.
        6 -> 'G'.
        7 -> 'H'.
        8 -> 'I'.
        9 -> 'J'.
        10 -> 'K'.
        11 -> 'L'.
        12 -> 'M'.
        13 -> 'N'.
        14 -> 'O'.
        15 -> 'P'.
        16 -> 'Q'.
        17 -> 'R'.
        18 -> 'S'.
        19 -> 'T'.
        20 -> 'U'.
        21 -> 'V'.
        22 -> 'W'.
        23 -> 'X'.
        24 -> 'Y'.
        25 -> 'Z'
    } asDictionary.
	
	^(mapper at: remainder).
]

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
CodiceFiscale class >> handleDateOfBirth: dateOfBirth andSex: sex [
	"A method that given a date of birth and the sex returns the letters that will be put in the CF"	
			
	^ (self handleYear: dateOfBirth), (self handleMonth: dateOfBirth), (self handleDay: dateOfBirth  andSex: sex).
]

{ #category : #helpers }
CodiceFiscale class >> handleDay: dateOfBirth andSex: sex [
	"A method that given a date of birth returns the letters corrisponding to the day"	
			
	^CodiceFiscaleUtilities padInteger: ((dateOfBirth dayOfMonth) + sex daysValue) with: 2.
]

{ #category : #helpers }
CodiceFiscale class >> handleMonth: dateOfBirth [
	"A method that given a date of birth returns the letters corrisponding to the month"	
			
	| mapper |
	mapper := 'ABCDEHLMPRST'.
	^(mapper at: (dateOfBirth monthIndex)) asString.
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

{ #category : #helpers }
CodiceFiscale class >> handleYear: dateOfBirth [
	"A method that given a date of birth returns the letters corrisponding to the year"	
			
	| year size |
	year := dateOfBirth year asString.
	size := year size.
	^String newFrom: { year at: size - 1 . year at: size }.
]
