Class {
	#name : #BaseLineOfInfraQuiz,
	#superclass : #Object,
	#category : #BaseLineOfInfraQuiz
}

{ #category : #baselines }
BaseLineOfInfraQuiz >> baseline: spec [
	<baseline>
	
	spec for: #common do: [
		
		"Load Boostrap CSS"	
		spec baseline: 'Bootstrap' with: [
				spec repository: 'github://astares/Seaside-Bootstrap:master/src';
					load ].
				
		"OSProcess"
		spec project: 'OSProcess' with: [
			spec
				className: 'ConfigurationOfOSProcess';
				loads: #('Core');
				repository: 'http://www.squeaksource.com/MetacelloRepository' ]		
	]
]
