#!/usr/bin/env bash

rm -rf InfraQuiz.image InfraQuiz.changes

./pharo ImageBase.image save InfraQuiz

./pharo InfraQuiz.image st --save --quit src/InfraQuiz.st
