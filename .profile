
_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true

if [ -t 1 ]; then
  exec zsh
fi
