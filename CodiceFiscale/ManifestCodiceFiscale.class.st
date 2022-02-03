"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCodiceFiscale,
	#superclass : #PackageManifest,
	#category : #'CodiceFiscale-Manifest'
}

{ #category : #'code-critics' }
ManifestCodiceFiscale class >> ruleAssignmentInIfTrueRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'CodiceFiscale class' #handleName: #true)) #'2022-02-03T01:01:30.880819+01:00') )
]
