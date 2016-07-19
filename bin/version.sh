#!/bin/bash

# Validates 'git describe' output, making sure that the tags on master follow the major.minor.patch format

VERSION=$(git describe)
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "git describe: $VERSION"

# print error message and exit if there is a commit on master without major.minor.patch tag
if [ "$BRANCH" == 'master' ] && ! `echo $VERSION | grep '^[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}$' 1>/dev/null 2>&1`
then
    echo "Version tags on master branch have to be in '<major>.<minor>.<path>' format'." 1>&2
    exit 1
fi

# if not release, add branch name to the version string
if [ "$BRANCH" != 'master' ];
then
    VERSION="${VERSION}-${BRANCH}"
fi

echo "$VERSION"
