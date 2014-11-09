# Beam ("Beam Me Up, Scotty!")

![Beam Me Up, Scotty!](http://www.thetimes.co.uk/tto/multimedia/archive/00436/133583538_star-trek_436777c.jpg)

A shell script for deploying GIT super-projects to the cloud.

GIT deployments are a must, but when you have submodules and private repositories in your project, you're going to have a bad time. This script compresses your entire project, submodules and all, into a single repository and pushes that package to your remote. The result is a perfect, clean deployment.

## Usage

Copy the files to into your project root:

```bash
curl -O https://raw.github.com/swt83/sh-beam/master/deploy
```

Modify the ``transport.sh`` file to include your remote destinations:

```bash
vim transport.sh
```

When you're ready, initiate a transport to deploy your project:

```bash
$ sh transport.sh
```

When pushing for the first time, a special parameter should be passed:

```bash
$ sh transport.sh init
```

For managing environments, you could alternately copy the script several times and modify each version with unique remotes:

```bash
$ sh transport_dev.sh
$ sh transport_prod.sh
```

## Particulars

- Sometimes a project contains various ``.gitignore`` files that prevent the script from pushing files you actually want to keep.  For me, this involves PHP's Composer package management system and the ``vendors/`` folder containing my dependencies.  I need the script to send those up to the server, and so I've added a way to modify the ``transport.sh`` script to un-ignore specific folders or files.