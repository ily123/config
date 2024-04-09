# config
Set up dev env on Ubuntu 22.04 (x86)

### Install Ansible
```bash
sudo apt update
sudo apt install ansible
```

### Install nvim
```bash
ansible-playbook playbooks/install-neovim.yaml --ask-become-pass
```
### Install nvim plugins
```bash
ansible-playbook playbooks/config-neovim.yaml --ask-become-pass
```

### Install i3 window manager
```bash
ansible-playbook playbooks/install-i3.yaml --ask-become-pass
```

### Install z
### Install docker
### Install AWS CLI / terraform ? you really need tf? really?
### Install cool wallpaper
