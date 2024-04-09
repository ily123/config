# config
Set up my dev environment on Ubuntu 22.04 (x86).

### Ansible
First, install Ansible.

```bash
sudo apt update
sudo apt install ansible
```
Then play Ansible playbooks below.

### nvim
```bash
ansible-playbook playbooks/install-neovim.yaml --ask-become-pass
```
### nvim plugins
```bash
ansible-playbook playbooks/config-neovim.yaml --ask-become-pass
```

### i3 window manager
```bash
ansible-playbook playbooks/install-i3.yaml --ask-become-pass
```

### z
### docker
### Install AWS CLI / terraform ? you really need tf? really?
