
Metacello new baseline: 'InfraQuiz';
   repository: 'gitlocal://./src';
   load.
	
	
" OLD Loading script
Metacello new
	baseline:'Bootstrap';
   repository: 'github://astares/Seaside-Bootstrap:master/src';
	load.

Metacello new 
	configuration: 'OSProcess'; 
	repository: 'http://www.squeaksource.com/MetacelloRepository';
	load.
"