#!/bin/bash
#
#Python code checker for git pre-commit hook

exit=0
for file in `git diff --cached --name-only --diff-filter=ACMRTUXB HEAD|grep '\.py$'`; do
    flake8 --ignore=W291,W391,W402,W404,W601,E123,E124,E125,E126,E127,E128,E226,E261,E262,E501,E502,E711,E712 $file
    if [ $? -ne 0 ]; then
        let exit=1
    fi
done

exit $exit
