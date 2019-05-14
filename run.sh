#!/bin/bash

./pharo InfraQuiz.image&
./pharo Executor.image eval --no-quit SeamlessNetwork new startServerOn: 40422.& 
