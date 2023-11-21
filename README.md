# Dev Environment Setup with Ansible

This repository contains an Ansible playbook for setting up a development environment with Zsh, Tmux, Neovim/LunarVim, custom aliases, and configuration for each component. The playbook is compatible with both Debian/Ubuntu (APT) and Fedora/CentOS (YUM/DNF) systems.

## Prerequisites

- Ansible 2.9 or higher.
- Target systems must be either Debian/Ubuntu or Fedora/CentOS based.
- SSH access to the target systems.
- Sudo privileges on the target systems.

## Repository Structure
```
.
├── README.md # This file
├── alias_list.yml # Contains custom aliases
├── config.lua # LunarVim configuration file
├── .tmux.conf # tmux configuration file
├── .gitconfig # git config 
└── playbook.yml # Ansible playbook
```


## Getting Started

1. **Clone the Repository**: Clone this repository to your local machine or Ansible control node.

```bash
git clone [Your Repository URL]
cd [Your Repository Name]
```
1. Configure Inventory (optional): Edit the inventory file to include the IP addresses or hostnames of the target machines.

```bash
[dev]
192.168.1.100
192.168.1.101
```
Replace the IP addresses with those of your target machines.

2. Customize Aliases and Configurations: Modify alias_list.yml and config.lua as needed to fit your preferences.

3. Run the Playbook: Execute the Ansible playbook. Ensure you have the necessary SSH access and privileges.

```
ansible-playbook -i user@$IP, playbook.yml
```
or 
```
ansible-playbook -i inventory playbook.yml
```

You might need to provide additional flags depending on your setup, such as `--user`, `--ask-become-pass`, etc.

## What Does the Playbook Do?

The `playbook.yml` performs the following tasks:

- Updates the package cache on the target systems.
- Installs development tools like Git, Zsh, Tmux, and development libraries.
- Installs Python development packages.
- Sets up Oh My Zsh for an enhanced shell experience.
- Installs and configures Neovim/LunarVim for advanced text editing.
- Sets up custom aliases from `alias_list.yml`.
- Applies custom configurations for Zsh, Tmux, and LunarVim.

## Customizations

You can customize the development environment setup by editing the following files:

- `alias_list.yml`: Define your own shell aliases here.
- `config.lua`: Customize LunarVim settings and plugins as per your requirement.

Feel free to fork this repository and modify the playbook and configuration files to suit your specific needs.
