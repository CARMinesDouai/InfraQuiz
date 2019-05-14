#!/bin/bash

./pharo InfraQuiz.image --no-quit&
./pharo Executor.image eval --no-quit SeamlessNetwork new startServerOn: 40422.& 
