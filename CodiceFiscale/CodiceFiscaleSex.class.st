Class {
	#name : #CodiceFiscaleSex,
	#superclass : #Object,
	#category : #CodiceFiscale
}

{ #category : #'helper methods' }
CodiceFiscaleSex class >> daysValue [
	"Returns how many days will be added to the day of birth in the CF in case of this Sex Value"
			
	Error signal: 'The class Sex must be subclassed in "Male" or "Female"'.
]
