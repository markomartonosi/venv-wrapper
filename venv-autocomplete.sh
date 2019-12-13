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


venv() {
  if [ $# -eq 0 ]
    then
      echo "Provide venv name"
    else
      source "$VENV_HOME/$1/bin/activate"
  fi
}

complete -W "$(lsvenv)" venv

mkvenv() {
  if [ $# -eq 0 ]
    then
      echo "Provide venv name"
    else
      python3.7 -m venv $VENV_HOME/$1
      complete -W "$(lsvenv)" venv
  fi
}

rmvenv() {
  if [ $# -eq 0 ]
    then
      echo "Provide venv name"
    else
      rm -r $VENV_HOME/$1
  fi
}


