#!/bin/sh
# =================================================
# A shell script for deploying GIT super-projects to the cloud.
#
# @package    Beam ("Beam Me Up, Scotty!")
# @author     Scott Travis <scott.w.travis@gmail.com>
# @link       http://github.com/swt83/sh-git-beam
# @license    MIT License
# =================================================

# -------------------------------------------------
# Set the files that you want to unignore.
# -------------------------------------------------
UNIGNORE=".gitignore|/vendor|composer.phar|composer.lock"

# -------------------------------------------------
# Set the local directory that we are working in,
# and make sure that we have a remote destination
# set and ready to go. Flight check.
# -------------------------------------------------
LOCAL=$(pwd)
REMOTE="$1"
if [ "$REMOTE" = "" ]
then
    echo "You failed to provide a remote GIT repository!";
    exit 1
fi
echo ""
echo "$REMOTE";

# -------------------------------------------------
# Capture the option ("boot"), if provided. This
# will mean the first push will fail, so we need
# to push some dummy files to get things rolling.
# -------------------------------------------------
OPTION="$2"
if [ "$OPTION" = "init" ]
then
    echo "/////////////////////////////////////////////////";
    echo "BOOTING BARE REPO W/ DUMMY FILES";
    cd ..
    rm -rf _temp > /dev/null 2>&1
    mkdir _temp > /dev/null 2>&1
    cd _temp
    touch index.php
    #touch composer.json # to satisfy Heroku
    git init > /dev/null 2>&1
    git add . > /dev/null 2>&1
    git commit -m "Working." > /dev/null 2>&1
    git remote add origin "$REMOTE" > /dev/null 2>&1
    git push origin master
    cd $LOCAL;
fi

# -------------------------------------------------
# Copy the local working directory to a temporary
# location and remove all existing GIT information,
# which acts to collapse submodules.
# -------------------------------------------------
cd ..
rm -rf _temp > /dev/null 2>&1
mkdir _temp > /dev/null 2>&1
cp -a $LOCAL/. _temp/ > /dev/null 2>&1
cd _temp
rm -rf `find . -name '.git'` > /dev/null 2>&1
rm -rf `find . -name '.gitmodules'` > /dev/null 2>&1
rm -rf `find . -name '.gitattributes'` > /dev/null 2>&1

# -------------------------------------------------
# Amend every .gitignore file to NOT ignore itself.
# We want to keep those files so we don't upload
# deliberately ignored files or folders.
# -------------------------------------------------
for f in $(find . -name '.gitignore')
do
    for i in $(echo $UNIGNORE | tr "|" "\n")
    do
      echo "\n!$i" >> $f;
    done
done

# -------------------------------------------------
# Create the new clean repository that has
# collapsed all the submodules that existed before.
# Original .gitignore rules still apply.
# -------------------------------------------------
git init > /dev/null 2>&1
git add . > /dev/null 2>&1
git commit -m "Changes." > /dev/null 2>&1

# -------------------------------------------------
# Clone the remote destination repository. We do
# this because we want to seamlessly splice in all
# our new files.  We do not want to push w/ force.
# -------------------------------------------------
git remote add cloud $REMOTE > /dev/null 2>&1
git fetch cloud > /dev/null 2>&1
git checkout -b remote remotes/cloud/master > /dev/null 2>&1

# -------------------------------------------------
# Delete every file that existed in the remote
# repository, then add all the files from the
# temporary working directory. A clean replacement.
# -------------------------------------------------
mv .git ../_git > /dev/null 2>&1
rm -rf * > /dev/null 2>&1
rm -rf .* > /dev/null 2>&1
rm -rf *.* > /dev/null 2>&1
mv ../_git .git
git rm -rf --cached . > /dev/null 2>&1
git add . > /dev/null 2>&1
git add -u > /dev/null 2>&1
git commit -m "Deletes." > /dev/null 2>&1
git merge master > /dev/null 2>&1
### git merge -s recursive -X theirs master > /dev/null 2>&1 ### alternate method?
git branch -d master > /dev/null 2>&1
git branch -mv remote master > /dev/null 2>&1

# -------------------------------------------------
# Now, finally, we push our collapsed repository
# made ready for deployment. Nice and clean with
# our file structure perfectly intact.
# -------------------------------------------------
echo "/////////////////////////////////////////////////";
git push cloud master
echo "/////////////////////////////////////////////////";
cd ..
rm -rf _temp > /dev/null 2>&1
echo ""