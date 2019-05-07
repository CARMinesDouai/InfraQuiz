#!/usr/bin/env bash

./clean.sh

wget -O- https://get.pharo.org/64 | bash

./pharo Pharo.image save ImageBase

./pharo ImageBase.image st --save --quit src/install.st

./pharo ImageBase.image save InfraQuiz

./pharo InfraQuiz.image st --save --quit src/InfraQuiz.st
