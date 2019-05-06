
"Loding Seaside - https://github.com/SeasideSt/Seaside"
"Metacello new
 baseline:'Seaside3';
 repository: 'github://SeasideSt/Seaside:v3.3.3/repository';
 load."
	
"Loading Bootstrap - that will Load Seaside too"
Metacello new
	baseline:'Bootstrap';
   repository: 'github://astares/Seaside-Bootstrap:master/src';
	load.

"Installer OSProcess"
Metacello new 
	configuration: 'OSProcess'; 
	repository: 'http://www.squeaksource.com/MetacelloRepository';
	load.
