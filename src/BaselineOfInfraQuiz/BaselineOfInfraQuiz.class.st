Class {
	#name : #BaselineOfInfraQuiz,
	#superclass : #BaselineOf,
	#category : #BaselineOfInfraQuiz
}

{ #category : #baselines }
BaselineOfInfraQuiz >> baseline: spec [
	<baseline>
	
	spec for: #common do: [
		
		"Load Boostrap CSS"	
		spec baseline: 'Bootstrap' with: [
				spec repository: 'github://astares/Seaside-Bootstrap:master/src';
					loads: #(default) ].
				
		"OSProcess"
		spec project: 'OSProcess' with: [
			spec
				className: 'ConfigurationOfOSProcess';
				loads: #('Core');
				repository: 'http://www.squeaksource.com/MetacelloRepository' ]		
	]
]
