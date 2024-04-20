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

### razer-cli
```bash
ansible-playbook playbooks/install-razer-cli.yaml --ask-become-pass
```
I could not automate the last step, so run this by hand:
```bash
razer-cli -d "Razer Basilisk V3" --dpi 1225 --brightness 0
```
Trying to run this from ansible results in an error. Also, don't try to put this in .bashrc, because it's too slow.

### z
### docker
### Install AWS CLI / terraform ? you really need tf? really?

---

### ssh key for Github
Make a new ssh key for every machine.

1. Make new key `ssh-keygen -t ed25519 -C "<github_email@address>"` in ~./ssh/
2. Upload public half to GitHub (account -> settings -> SSH and CPG keys)
3. Map Gihub to its key in `~./ssh/config`. Yes, `User` field should be `git`:
```
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/key_file_you_just_made
  IdentitiesOnly yes
```
4. Check that git recognizes the key
```bash
ssh -T git@github.com
```
