# Deploy

A shell script for using GIT to deploy projects to the cloud.

* Does not require the working directory to be a GIT repo.
* Will respectfully block the files defined in ``.gitignore``.
* Will perfectly collapse all submodules in the project.
* Will perfectly overwrite remote files, w/out force.

Clean repository deployments, every time.

## Install

Create a simple terminal alias in your ``.bashrc`` file:

```
alias gitdeploy='curl -O https://raw.github.com/swt83/sh-git-deploy/master/deploy'
```

Download the script to any working directory:

```
$ gitdeploy
```

Manually amend the file to include the location of your remote repository.

## Usage

From your working directory:

```
$ sh deploy
```

Your files will immediately be pushed to the remote.

## Notes

BE CAREFUL! When starting a new project, make sure you use a clean copy of ``deploy`` or you could accidentally overwrite another existing cloud repository.