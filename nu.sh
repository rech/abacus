#!/bin/bash

set -e
set -x

rm -rf packages/

nuget install -o packages/
