"
Write C file directly in the physical machine, compile them with GCC and execute them.
"
Class {
	#name : #CFileBasedExecutor,
	#superclass : #FileBasedExecutor,
	#category : #InfraQuizExecutor
}

{ #category : #execution }
CFileBasedExecutor >> evalCode [
	self writeInputFile.
	OSProcess waitForCommand: 'gcc -o c/bin/input c/src/input.c'.
	OSProcess waitForCommand: 'c/bin/input > ',self outputFile.
	self saveOutput.
]

{ #category : #writing }
CFileBasedExecutor >> writeInputFile [
	|input|
	File deleteFile:'c/src/input.c'. 
	input:='c/src/input.c' asFileReference.
	input writeStreamDo: [ :stream | stream nextPutAll: self code ].
]
