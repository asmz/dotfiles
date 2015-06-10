function str_with_color() {
    echo "%{$fg[$1]%}$2%{$reset_color%}"
}

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}) "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

CURRENT_DIRECTORY=$(str_with_color cyan '%~')
HOSTNAME=$(str_with_color yellow '%m')
PROMPT_CHAR_OK='$ '
PROMPT_CHAR_NG=$(str_with_color red ${PROMPT_CHAR_OK})
PROMPT='[${CURRENT_DIRECTORY}@${HOSTNAME}] $(git_prompt_info)
%(?.${PROMPT_CHAR_OK}.${PROMPT_CHAR_NG})'
