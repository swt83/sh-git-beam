# Deploy for GIT #

``deploy`` is a shell script for deploying GIT projects to the cloud.  It takes your current working directory as-is and uploads it to a remote GIT repository of your choosing.  It automatically collapses any submodules you may have, maintains your folder structure, and preserves your existing .gitignore files.  Additionally, it seamlessly splices in your latest files to whatever existed before, so you never have to push w/ force.

The result is a clean deployment to your remote destination, all with a single terminal command.  I encourage you to take a look at the file to see what exactly it does, any why.  This script is designed for use with phpFog, AppFog, or any server setup with automated GIT deployments.

## Install ##

Download ``deploy`` to your working directory. Open the file and input your remote GIT repository destination as the ``REMOTE`` variable.

## Usage ##

From the command-line:

```
sh deploy
```

## Warning ##

BE CAREFUL! When starting a new project, make sure you use a clean copy of ``deploy`` or you could accidentally overwrite another existing cloud repository.

## Server ##

In the ``server`` folder I've included two files for use on my server.  I copy them both to my server homefolder, and run ``sh build <PROJECTNAME>`` to automate the creation of bare GIT repos on my server that are prepared for automated deployment to my docroot. Several user permissions are required to get this working properly.