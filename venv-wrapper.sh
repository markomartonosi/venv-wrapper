# Venv wrapper
# usage
# $ mkvenv myvirtualenv # creates venv under ~/.venv/
# $ venv myvirtualenv   # activates venv
# $ deactivate          # deactivates venv
# $ rmvenv myvirtualenv # removes venv

export VENV_HOME="$HOME/.venv"
[[ -d $VENV_HOME ]] || mkdir $VENV_HOME

lsvenv(){
    ls $VENV_HOME
}

complete -W "$(lsvenv)" venv

venv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      if [[ -d "$VENV_HOME/$1" ]]
        then
          source "$VENV_HOME/$1/bin/activate"
        else
          read -p "Venv doens't exist. Create new one? [Y/n]: " b
          if [[ "$b" == "" ]] || [[ "$b" == "Y" ]] || [[ "$b" == "y" ]]
            then
              mkvenv "$1"
              source "$VENV_HOME/$1/bin/activate"  
          fi
      fi
  fi
}


mkvenv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      python3.7 -m venv $VENV_HOME/$1
      complete -W "$(lsvenv)" venv
  fi
}

rmvenv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      rm -r $VENV_HOME/$1
  fi
}


