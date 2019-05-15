#!/bin/bash

./pharo InfraQuiz.image --no-quit&
docker run -d -p:40422:40422 dockerexecutor
