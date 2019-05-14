#!/bin/bash

./pharo InfraQuiz.image --no-quit&
docker run --name sandbox -d -p:40422:40422 dockerexecutor
