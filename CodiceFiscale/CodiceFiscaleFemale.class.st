Class {
	#name : #CodiceFiscaleFemale,
	#superclass : #CodiceFiscaleSex,
	#category : #CodiceFiscale
}

{ #category : #'helper methods' }
CodiceFiscaleFemale class >> daysValue [
	"Returns how many days will be added to the day of birth in the CF in case of this Sex Value"
			
	^40.
]
