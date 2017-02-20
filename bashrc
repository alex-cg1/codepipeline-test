if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

if [ -d "/venv2" ]; then
  source /venv2/bin/activate
fi

if [ -d "/venv3" ]; then
  source /venv3/bin/activate
fi

if [ -n "${PROJECT_ROOT}" ]; then
  cd ${PROJECT_ROOT}
fi
