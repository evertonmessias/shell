#!/bin/bash
clear
rm .gitignore
echo "*********** REMOVIDO GITIGNORE OK ******************"
git add *
echo "**************** GIT ADD OK ************************"
data=`date +%d-%m-%Y_%H:%M:%S`
git commit -m $data
echo "*************** GIT COMMIT OK **********************"
git push
