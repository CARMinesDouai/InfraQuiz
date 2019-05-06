#!/usr/bin/env bash

./clean.sh

wget -O- https://get.pharo.org/64 | bash

./pharo Pharo.image save InfraQuiz

./pharo InfraQuiz.image st --save --quit src/install.st src/InfraQuiz.st

