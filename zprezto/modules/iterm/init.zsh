if [[ -z $ITERM_PROFILE ]]; then
  return 1
fi

function iterm_profile {
  if [[ -z $1 ]]; then
    profile="Default"
  else
    profile="$1"
  fi

  echo -e "\033]50;SetProfile=$profile\a"
}

function adapt_theme {
  dark_mode="$(dark-mode status)"

  if [ "$dark_mode" = "on" ]; then
    profile="Dark"
  else
    profile="Light"
  fi

  iterm_profile "$profile"
  ITERM_PROFILE="$profile"
}

adapt_theme

