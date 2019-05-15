Metacello new 
	baseline: 'Seamless'; 
	repository: 'github://dionisiydk/Seamless'; 
	load.
Gofer new
    squeaksource: 'MetacelloRepository';
    package: 'ConfigurationOfOSProcess';
    load.

((Smalltalk at: #ConfigurationOfOSProcess) project version: #stable) load.
SeamlessNetwork new startServerOn: 40422.
SmalltalkImage current snapshot: true andQuit: true
