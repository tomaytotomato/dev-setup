# Dev Setup - Kubuntu 🐧

This repository contains scripts, configs and Ansible that I use to setup my development environment.

This has been designed for Kubuntu (25.04+) 🖳 however if you use regular Ubuntu it should still work ok.

Tools I mainly use are:

- Java and Maven (provisioned with SDKman) ♨️
- Docker 🐋
- Node
- SDKMan
- LinuxBrew 🍺
- Bash (with BashIT plugin)

| Distro  | Version(s) | CPU                | SKU                                        |
|---------|------------|--------------------|--------------------------------------------|
| Kubuntu | 25.04      | Intel/ARM (64-bit) | [Desktop](https://kubuntu.org/getkubuntu/) |

The structure of the files are like so:

  - main.yml
    - core.yml
    - tool a.yml, b.yml, c.yml etc.
    - final tasks : java.yml etc.

**Note** some programs are installed using snap.

Text shell customization assumes you're using bash.

GUI shell customization assumes you're using KDE on desktop Linux.

# Onboarding

One-command flow for a fresh machine:

1. Bootstrap the Python venv and install Ansible + collections:

   ```shell
   ./pre-setup.sh
   ```

2. Activate the venv in your current shell:

   ```shell
   source ~/.venvs/ansible/bin/activate
   ```

3. Run the site playbook (prompts for sudo password):

   ```shell
   ansible-playbook site.yml -K
   ```

4. Optional post-install tweaks:

   ```shell
   ./post-setup.sh
   ```

# Common commands

| Command                                          | What it does                                    |
|--------------------------------------------------|-------------------------------------------------|
| `make lint`                                      | Run yamllint and ansible-lint inside the venv   |
| `make check`                                     | Dry-run the site playbook (`--check --diff`)    |
| `make run`                                       | Run the site playbook                           |
| `ansible-playbook site.yml -K --tags docker`     | Run only tasks tagged `docker`                  |
| `make tags`                                      | List all tags available in the site playbook    |

# Tags

`#java` `#bash` `#kubuntu` `#docker` `#maven` `#git` `#bash-it` `#sdkman` `#linuxbrew` `#ansible`

# Credits

Forked from - https://github.com/bradwilson/ansible-dev-pc

Feel free to fork and customize this repo for your needs

MIT License
