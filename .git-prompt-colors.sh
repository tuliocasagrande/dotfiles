override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Custom"

  function prompt_callback {
    gp_set_window_title "\W"
  }

  PathShort="\W";
  GIT_PROMPT_BRANCH="${BoldMagenta}"

  GIT_PROMPT_PREFIX="("
  GIT_PROMPT_SUFFIX=")"
  GIT_PROMPT_SEPARATOR="|"
  GIT_PROMPT_STAGED="${Red}●"
  GIT_PROMPT_CONFLICTS="${BoldRed}✖"
  GIT_PROMPT_CHANGED="${BoldBlue}✚"
  GIT_PROMPT_UNTRACKED="${Cyan}…"
  GIT_PROMPT_STASHED="${BoldBlue}⚑"
  GIT_PROMPT_CLEAN="${BoldGreen}✔"

  GIT_PROMPT_REMOTE=""
  GIT_PROMPT_SYMBOLS_AHEAD="↑"
  GIT_PROMPT_SYMBOLS_BEHIND="↓"

  GIT_PROMPT_COMMAND_OK="$"
  GIT_PROMPT_COMMAND_FAIL="${BoldRed}$"

  GIT_PROMPT_START_USER="${BoldBlack}${Time12a}${ResetColor} ${Green}${PathShort}${ResetColor}"
  GIT_PROMPT_END_USER=" _LAST_COMMAND_INDICATOR_ ${ResetColor}"
}

reload_git_prompt_colors "Custom"
