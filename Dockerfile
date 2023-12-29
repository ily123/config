FROM ubuntu:22.04
RUN apt update -y
RUN apt install ansible -y
RUN apt install git -y

WORKDIR /config

COPY playbooks/ /config/playbooks

RUN ansible-playbook playbooks/install-neovim.yaml

RUN nvim --appimage-extract

COPY dotfiles/ /config/dotfiles

RUN ansible-playbook playbooks/config-neovim.yaml
