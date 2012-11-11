# Deploy for GIT #

``deploy`` is a shell script for deploying GIT projects to the cloud.  It takes your current working directory as-is (even if it's not a GIT repo or even if you're between commits) and pushes everything to a remote GIT repository of your choosing.  The script collapses any submodules you might have into a new single repository, while honoring your .gitignore files and preserving your existing folder structure.  The script is careful in merging your project into whatever exists on the remote repository, so you never have to use force to overwrite those remote files.  The result is a single, perfect, GIT repository pushed to your remote destination.

Please take a look at ``deploy`` to see exactly what it does and why.  The script is designed for use with phpFog, AppFog, or any server setup with automated GIT deployments.

## Install ##

Download ``deploy`` to your working directory. Open the file and input your remote GIT repository destination as the ``REMOTE`` variable.

### Advanced ###

If you wanted to be cool, you could create a terminal alias for easy download into your working directory.

In your ``.bashrc`` file, add:

```
alias gitdeploy='curl -O https://raw.github.com/swt83/git-deploy/master/deploy'
```

Then download with a simple terminal command:

```
→ gitdeploy
```

## Usage ##

From the command-line:

```
→ sh deploy
```

BE CAREFUL! When starting a new project, make sure you use a clean copy of ``deploy`` or you could accidentally overwrite another existing cloud repository.