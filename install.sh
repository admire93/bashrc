#!/bin/sh

old="$HOME/bashrc.old"
bashrc="$HOME/.bashrc"
bash_alias="$HOME/.bash_alias"
bash_env="$HOME/.bash_env"

mkdir -p $old

if [ -e $bashrc ];
then
  mv "$bashrc" "$old/bashrc"
fi

if [ -e $bash_alias ];
then
  mv "$bash_alias" "$old/bash_alias"
fi

if [ -e $bash_env ];
then
  mv "$bash_env" "$old/bash_env"
fi

ln -s "$(pwd)/bashrc" "$bashrc"
ln -s "$(pwd)/bash_alias" "$bash_alias"
ln -s "$(pwd)/bash_env" "$bash_env"
