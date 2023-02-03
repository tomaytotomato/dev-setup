# Ansible Dev Setup

A customised list of Ansible playbooks to setup my Kubuntu Dev machine

Three main components to the setup are:

- Pre setup (tools, dependencies)
- Install tools, software
- Post setup (customize UI, shell, .dotfiles)

Tools I mainly use are:

- Java and Maven (provisioned with SDKman)
- Docker
- Node
- SDKMan
- LinuxBrew

**Note** some programs are installed using snap.

| Distro  | Version(s) | CPU            | SKU                                        |
|---------|------------|----------------|--------------------------------------------|
| Kubuntu | 22.10      | Intel (64-bit) | [Desktop](https://kubuntu.org/getkubuntu/) |

Text shell customization assumes you're using bash.

GUI shell customization assumes you're using KDE on desktop Linux.

Alternate distros and/or shells are left as an exercise for the reader.

## Please fork this and customize it

The purpose here is to document what I use for my personal Linux-based development. You will likely want to make changes
to my customizations, including adding/removing software, choosing different defaults, etc. While you can make those
changes locally, if you plan to use these scripts long-term, it will likely be more beneficial for you if you fork this
project so you can preserve your changes and easily merge newer versions of these scripts.

# Pre-Requisites

1. Make sure packages are up to date

   ```shell
   $ sudo apt update
   $ sudo apt -y upgrade
   ```

2. Install Ansible:

   ```shell
   $ sudo apt -y install ansible
   ```

3. If you want to clone this Git repo, you should also install Git (`sudo apt -y install git`). These scripts will
   install it for you if you brought these files along in some other way.

# Running

Before running the scripts, please review `_all.yaml` and `_all_no_customization.yaml`, and comment out software you
don't want installed. In particular, most folders contain `customization.yaml` files which tend to contain my personal
opinions on customizations; feel free to comment out sections of those files, or ignore them entirely.

To run the setup:

```shell
$ ansible-playbook -K customize.yaml
```

You will be prompted for your password, so that administrative-level software can be installed.
_**You must be a sudoer to run these scripts, otherwise the installation process will fail.**_ You can also run
individual files if you'd prefer to take more control over what's executed.


## Credits

Forked from - https://github.com/bradwilson/ansible-dev-pc
