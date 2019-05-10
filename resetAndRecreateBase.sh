#!/usr/bin/env bash

./clean.sh

wget -O- https://get.pharo.org/64 | bash

./pharo Pharo.image save InfraQuiz

./pharo InfraQuiz.image eval --save "Metacello new baseline: 'InfraQuiz'; repository: 'gitlocal://./src'; load."

./pharo InfraQuiz.image save ImageBase