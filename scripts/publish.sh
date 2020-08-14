#!/bin/sh -e

PACKAGE="ormar"

PREFIX=""
if [ -d 'venv' ] ; then
    PREFIX="venv/bin/"
fi

VERSION=`cat ${PACKAGE}/__init__.py | grep __version__ | sed "s/__version__ = //" | sed "s/'//g"`

set -x

scripts/clean.sh

${PREFIX}python setup.py sdist
${PREFIX}twine upload dist/*

echo "You probably want to also tag the version now:"
echo "git tag -a ${VERSION} -m 'version ${VERSION}'"
echo "git push --tags"

scripts/clean.sh