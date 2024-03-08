# Dev Setup - Kubuntu 🐧

This repository contains scripts, configs and Ansible that I use to setup my development environment.

This has been designed for Kubuntu distro (22.10+) 🖳 however if you use regular Ubuntu it should still work ok.

Tools I mainly use are:

- Java and Maven (provisioned with SDKman) ♨️
- Docker 🐋
- Node
- SDKMan
- LinuxBrew 🍺
- Bash (with BashIT plugin)

| Distro  | Version(s) | CPU            | SKU                                        |
|---------|------------|----------------|--------------------------------------------|
| Kubuntu | 23.10      | Intel (64-bit) | [Desktop](https://kubuntu.org/getkubuntu/) |

The structure of the files are like so:

  - main.yml
    - core.yml
    - tool a.yml, b.yml, c.yml etc.
    - final tasks : kde.yml, java.yml etc.

**Note** some programs are installed using snap.

Text shell customization assumes you're using bash.

GUI shell customization assumes you're using KDE on desktop Linux.

# Pre-Requisites

1. Make sure packages are up to date by running the pre-setup bash script.

   ```shell
   $ ./pre-setup.sh
   ```

# Running

Since some ansible playbooks will modify at system level, sudo permissions are required.
Equally though some applications like linuxbrew do not like being installed with sudo permissions.

Therefore there are two stages that need to be run, as below:

- main.yml (system level changes)
- user.yml (user / home level changes)

```shell
$ sudo ansible-playbook main.yml # needs to be run as sudo
$ ansible-playbook user.yml # don't run with sudo
```

# After

Some additional tweaks and customizations are done by running the post-setup bash script

   ```shell
   $ ./post-setup.sh
   ```

# Tags

`#java` `#bash` `#kubuntu` `#docker` `#maven` `#git` `#bash-it` `#sdkman` `#linuxbrew` `#ansible`

# Credits

Forked from - https://github.com/bradwilson/ansible-dev-pc

Feel free to fork and customize this repo for your needs

MIT License
