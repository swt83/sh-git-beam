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
# Input your remote repositories.
# -------------------------------------------------
DESTINATION[0]="git@foobar.com:repo.git"
#DESTINATION[1]="git@foobar.com:repo.git"
#DESTINATION[2]="git@foobar.com:repo.git"

# -------------------------------------------------
# Engage.
# -------------------------------------------------
for D in "${DESTINATION[@]}"
do
    sh .beam/transporter.sh "$D" "$1"
done