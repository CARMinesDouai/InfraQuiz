Metacello new 
	baseline: 'Seamless'; 
	repository: 'github://dionisiydk/Seamless'; 
	load.
"Gofer new 
	squeaksource3: 'coral'; 
	package: 'OSProcess'; 
	load."
SeamlessNetwork new startServerOn: 40422.
SmalltalkImage current snapshot: true andQuit: true
