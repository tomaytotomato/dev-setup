# Ansible Dev Setup - Kubuntu 🐧

This repository contains Ansible playbooks to install the necessary tools I find useful for
working as a Software Engineer on my Linux machine.

This has been designed for Kubuntu distro (22.10+) 🖳

| Distro  | Version(s) | CPU            | SKU                                        |
|---------|------------|----------------|--------------------------------------------|
| Kubuntu | 22.10      | Intel (64-bit) | [Desktop](https://kubuntu.org/getkubuntu/) |

The structore of the files are like so:

  - main.yml
    - core.yml
    - tool a.yml, b.yml, c.yml etc.
    - final tasks : kde.yml, java.yml etc.

Tools I mainly use are:

- Java and Maven (provisioned with SDKman) ♨️
- Docker
- Node
- SDKMan
- LinuxBrew
- Bash

**Note** some programs are installed using snap.


Text shell customization assumes you're using bash.

GUI shell customization assumes you're using KDE on desktop Linux.


# Pre-Requisites

1. Make sure packages are up to date

   ```shell
   $ sh ./pre-setup.sh
   ```

# Running

```shell
$ sudo ansible-playbook main.yaml # needs to be run as sudo
% ansible-playbook user.yaml
```

# Tags

`#java` `#bash` `#kubuntu` `#docker` `#maven` `#git` `#bash-it` `#sdkman` `#linuxbrew`

# Credits

Forked from - https://github.com/bradwilson/ansible-dev-pc

Feel free to fork and customize this repo for your needs

MIT License
