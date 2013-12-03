source $HOME/.bash_env
source $HOME/.bash_alias

# automatically activate virtualenv when change a directory.

source /usr/local/bin/virtualenvwrapper.sh
 
check_venvwrapper() {
  red='\033[1;31m'
  cyan='\033[1;36m'
  NC='\033[0m'
  venv="$(pwd)/.virtualenvwrapper"
  if [ -e $WORKON_HOME ] && [ -e $venv ];
  then
    venv_name="$(cat $venv)"
    echo -e "${cyan}virtualenv(name=${NC}${red}$venv_name${cyan})${NC} activated!"
    workon "$venv_name";
  fi
}

venv_cd() {
  builtin cd "$@" && check_venvwrapper $@
}

alias cd="venv_cd"
