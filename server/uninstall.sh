#!/bin/bash

sfctl application delete --application-id server
sfctl application unprovision --application-type-name serverType --application-type-version 1.0.0
sfctl store delete --content-path server
