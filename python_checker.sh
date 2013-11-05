#!/bin/bash
#
#Python code checker for git pre-commit hook

exit=0
for file in `git diff --cached --name-only --diff-filter=ACM|grep '\.py$'`; do
    flake8 --ignore=W402,E501,W801,W806,W404,E125,E126,E128 $file
    if [ $? -ne 0 ]; then
        let exit=1
    fi
done

exit $exit
