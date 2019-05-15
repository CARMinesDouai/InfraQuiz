Class {
	#name : #BaselineOfInfraQuiz,
	#superclass : #BaselineOf,
	#category : #BaselineOfInfraQuiz
}

{ #category : #baselines }
BaselineOfInfraQuiz >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ "Load Boostrap CSS"
			spec
				baseline: 'Bootstrap'
				with: [ spec
						repository: 'github://astares/Seaside-Bootstrap:master/src';
						loads: #(default) ].

			"OSProcess"
			spec
				project: 'OSProcess'
				with: [ spec
						className: 'ConfigurationOfOSProcess';
						loads: #('Core');
						repository: 'http://www.squeaksource.com/MetacelloRepository' ].
			spec
				baseline: 'Seamless'
    			with: [ spec 
					repository: 'github://dionisiydk/Seamless:v0.9.x';
					loads: #(default)].
			spec
				package: 'InfraQuiz'
				with: [ spec requires: #('Bootstrap' 'OSProcess') ].
			spec
				package: 'InfraQuizExecutor'
				with: [ spec requires: #('InfraQuiz') ].
			spec group: 'default' with: #('InfraQuiz') ]
]
