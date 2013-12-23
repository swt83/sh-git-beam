# Deploy

A shell script for using GIT to deploy projects to the cloud. Clean working directory deployments, every time.

## Install

Create a simple terminal alias in your ``.bashrc`` file:

```bash
alias 'deploy install'='curl -O https://raw.github.com/swt83/sh-git-deploy/master/deploy && curl -O https://raw.github.com/swt83/sh-git-deploy/master/deport'
```

Use the alias to install the deploy scripts to your working directory:

```bash
$ deploy install
```

Manually amend the ``deport`` file to include the location(s) of your remote repository(s):

```bash
sh deploy foo@bar3.net:myrepo.git
```

## Usage

From your working directory:

```bash
$ sh deport
```

Your files will immediately be pushed to the remote(s).

## Notes

- Sometimes a project contains various ``.gitignore`` files that prevent the script from pushing files it really should.  For me, this involves PHP's Composer package management system and the ``vendors/`` folder containing in my dependencies.  I actually need the deploy script to send those up to the server, and so I've added a way to modify the ``deploy`` script to un-ignore specific folders or files.