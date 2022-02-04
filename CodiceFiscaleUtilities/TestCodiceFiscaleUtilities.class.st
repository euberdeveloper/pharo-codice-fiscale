Class {
	#name : #TestCodiceFiscaleUtilities,
	#superclass : #TestCase,
	#category : #CodiceFiscaleUtilities
}

{ #category : #tests }
TestCodiceFiscaleUtilities >> testArraySwap [	
			
	| array |
	array := OrderedCollection new
		add: 1;
		add: 2;
		add: 3;
		add: 4;
		add: 5;
		yourself.
		
	CodiceFiscaleUtilities arraySwap: array element: 3 with: 4.
	self assert: (array at: 3) equals: 4.
	self assert: (array at: 4) equals: 3.
	 
	CodiceFiscaleUtilities arraySwap: array element: 3 with: 23.
]

{ #category : #tests }
TestCodiceFiscaleUtilities >> testPadIntegerWith [	
			
	| result |
	result := CodiceFiscaleUtilities padInteger: 5 with: 1.
	self assert: result equals: '5'.
	
	result := CodiceFiscaleUtilities padInteger: 5 with: 2.
	self assert: result equals: '05'.
	
	result := CodiceFiscaleUtilities padInteger: 10 with: 2.
	self assert: result equals: '10'.
]
