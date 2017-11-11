#!/bin/bash

sfctl application upload --path server --show-progress
sfctl application provision --application-type-build-path server
sfctl application create --app-name fabric:/server --app-type serverType --app-version 1.0.0
