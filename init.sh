#!/usr/bin/bash 

set -e

MAINDIR=$1
NAME=$2
DATE=$(date +'%Y-%m-%d')

PROJECT="${MAINDIR}/${DATE}_${NAME}"

printf "Set up new project structure for $PROJECT\n\n"

## Folder structure
INPUTDIR="${PROJECT}/data"
SCRIPTDIR="${PROJECT}/code"
ANALYSESDIR="${PROJECT}/analyses"
PLOTDIR="${PROJECT}/plot"
CRUFTDIR="${PROJECT}/cruft"
REPORTDIR="${PROJECT}/report"
TMPDIR="${PROJECT}/tmp"

## Make folders
for d in $PROJECT $INPUTDIR $SCRIPTDIR $ANALYSESDIR $PLOTDIR $CRUFTDIR $REPORTDIR $TMPDIR; do
    mkdir -p $d
done

## Main README
echo "# ${NAME}" > $PROJECT/README.md
touch $REPORTDIR/README.md

## Init git repo for code
cd $SCRIPTDIR && git init --quiet
echo "# Code: ${NAME}" > README.md && git add README.md
mkdir -p $SCRIPTDIR/src && git add src
git commit -m 'Initial project version' --quiet
git remote add origin git@github.com:hoelzer/${DATE}_${NAME}.git

printf "Dont forget to generate the repo:\n\n${DATE}_${NAME}\n\nfollowed by:\n\ncd ${SCRIPTDIR} && git push -u origin master\n\n"