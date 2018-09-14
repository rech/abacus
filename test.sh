#!/bin/bash

set -e
set -x

mono packages/NUnit.Runners.*/tools/nunit-console.exe bin/abacus.test.dll
