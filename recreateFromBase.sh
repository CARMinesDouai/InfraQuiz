#!/usr/bin/env bash

rm -rf InfraQuiz.image InfraQuiz.changes Executor.image Executor.changes

./pharo ImageExecutorBase save Executor

./pharo ImageBase.image save InfraQuiz
