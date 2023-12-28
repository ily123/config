FROM ubuntu:22.04
RUN apt update -y
RUN apt install ansible -y

WORKDIR /config
COPY . /config

RUN ansible-playbook playbooks/install-neovim.yaml

RUN nvim --appimage-extract

