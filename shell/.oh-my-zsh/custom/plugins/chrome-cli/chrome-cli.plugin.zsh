__chrome_cli_complete() {
  typeset -a commands build_flags
  commands+=(
     'help'
     'list'
     'info'
     'open'
     'close'
     'reload'
     'back'
     'forward'
     'activate'
     'presentation'
     'size'
     'position'
     'source'
     'execute'
     'version'
  )
  if (( CURRENT == 2 )); then
    # explain go commands
    _values 'go tool commands' ${commands[@]}
    return
  fi
  case ${words[2]} in
  list)
    _values "list commands" tabs links
    ;;
  info|open|close|reload|back|forward|activate|presentation|size|position|source|execute|version)
    ;;
  esac
}

compdef __chrome_cli_complete chrome-cli
