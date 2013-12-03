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


c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

parse_git_branch ()
{
   if git rev-parse --git-dir >/dev/null 2>&1
   then
      gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
   else
      return 0
   fi
   echo -e $gitver
}

branch_color ()
{
   if git rev-parse --git-dir >/dev/null 2>&1
   then
      color=""
      if git diff --quiet 2>/dev/null >&2
      then
         color="${c_green}"
      else
         color=${c_red}
      fi
   else
      return 0
   fi
   echo -ne $color
}

export PS1='\u in \W\[${c_sgr0}\] (\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\])\$ '
