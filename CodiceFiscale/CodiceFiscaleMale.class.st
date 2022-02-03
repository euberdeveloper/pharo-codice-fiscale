Class {
	#name : #CodiceFiscaleMale,
	#superclass : #CodiceFiscaleSex,
	#category : #CodiceFiscale
}

{ #category : #'helper methods' }
CodiceFiscaleMale class >> daysValue [
	"Returns how many days will be added to the day of birth in the CF in case of this Sex Value"
			
	^0.
]
