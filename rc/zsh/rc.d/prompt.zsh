function str_with_color() {
    echo "%{$fg[$1]%}$2%{$reset_color%}"
}

function my_git_status() {
    [ $(current_branch) ] && echo "($(str_with_color red $(current_branch)))"
}

CURRENT_DIRECTORY=$(str_with_color cyan '%~')
HOSTNAME=$(str_with_color yellow '%m')
PROMPT_CHAR_OK='$ '
PROMPT_CHAR_NG=$(str_with_color red ${PROMPT_CHAR_OK})
PROMPT='[${CURRENT_DIRECTORY}@${HOSTNAME}] $(my_git_status)
%(?.${PROMPT_CHAR_OK}.${PROMPT_CHAR_NG})'
