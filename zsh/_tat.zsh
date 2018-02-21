compdef _tat tat

function _tat {
  local line

  sessions="$(tmux ls | sed 's/^\(.*\): .*$/\1/' | awk '!/0$/{printf "%s ", $0}/0$/')"

  _arguments -C \
    "1: :($sessions)" \
    "*::arg:->args"
}
