#!/bin/sh
mkdir .git/hooks
cp contrib/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
