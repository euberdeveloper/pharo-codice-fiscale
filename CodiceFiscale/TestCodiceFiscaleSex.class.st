Class {
	#name : #TestCodiceFiscaleSex,
	#superclass : #TestCase,
	#category : #CodiceFiscale
}

{ #category : #tests }
TestCodiceFiscaleSex >> testAbstractClass [

	self
		should: [CodiceFiscaleSex daysValue]
		raise: Error.
]

{ #category : #tests }
TestCodiceFiscaleSex >> testFemaleClass [

	| result |
	result := CodiceFiscaleFemale daysValue.
	self assert: result equals: 40.
]

{ #category : #tests }
TestCodiceFiscaleSex >> testMaleClass [

	| result |
	result := CodiceFiscaleMale daysValue.
	self assert: result equals: 0.
]
