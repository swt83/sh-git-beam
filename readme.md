# Beam ("Beam Me Up, Scotty!")

A shell script for deploying GIT super-projects to the cloud.

![Beam Me Up, Scotty!](http://www.thetimes.co.uk/tto/multimedia/archive/00436/133583538_star-trek_436777c.jpg)

GIT deployments are a must, but when you have submodules and private repositories in your project, you're going to have a bad time. This script compresses your entire project, submodules and all, into a single repository and pushes that package to your remote. The result is a perfect, clean deployment. It pushes whatever you have at the moment, regardless of commits.

## Usage

Copy the files to into your project root:

```bash
$ curl -O https://raw.github.com/swt83/sh-beam/master/deploy
```

Modify the ``beam.sh`` file to include your remote destinations:

```bash
$ vim beam.sh
```

When you're ready, initiate a transport to deploy your project:

```bash
$ sh beam.sh
```

When pushing for the first time to a bare repo, a special parameter should be passed:

```bash
$ sh beam.sh init
```

To manage environments, you can alternately copy the script several times and modify each version with unique remotes:

```bash
$ sh beam_dev.sh
$ sh beam_prod.sh
```

Usually, because I'm lazy, I rename the file to be as few characters as possible:

```bash
$ sh b
```

Watch the script deploy your project.

## A Word About ``.gitignore`` Files

The script tries to honor your ``.gitignore`` files. This is to prevent pushing massive files that aren't needed, wasting space and bandwidth.

However, sometimes a project contains various ``.gitignore`` files that prevent the script from pushing files you actually want to preserve.  For me, this involves PHP's Composer package management system and the ``vendors/`` folder containing my dependencies.  I need these dependencies to get pushed, regardless of the ``.gitignore`` file.

You can modify the ``transport.sh`` file to un-ignore specific folders or files.  An array of those files already exists, which you can amend as needed.