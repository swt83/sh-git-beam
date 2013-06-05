# Deploy

A shell script for using GIT to deploy projects to the cloud. Clean working directory deployments, every time.

## Install

Create a simple terminal alias in your ``.bashrc`` file:

```
alias gitdeploy='curl -O https://raw.github.com/swt83/sh-git-deploy/master/deploy'
```

Download the script to any working directory:

```
$ gitdeploy
```

Manually amend the file to include the location of your remote repository:

```
REMOTE="foo@bar.net:myrepo.git"
```

## Usage

From your working directory:

```
$ sh deploy
```

Your files will immediately be pushed to the remote.

## Scaling

You may need to push to multiple servers, in which case you can amend the script to accept input:

```
REMOTE="$1"
```

Then create a new file, say ``deport``, and issue each command:

```
#!/bin/sh

sh deploy foo@bar1.net:myrepo.git
sh deploy foo@bar2.net:myrepo.git
```

Finally, you can mass-deploy:

```
sh deport
```
