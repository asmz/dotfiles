function str_with_color() {
    echo "%{$fg[$1]%}$2%{$reset_color%}"
}

function my_git_status() {
    [ $(current_branch) ] && echo "$(git_prompt_info)"
}

CURRENT_DIRECTORY=$(str_with_color blue '%~')
HOSTNAME=$(str_with_color green '%m')
PROMPT_CHAR_OK='$ '
PROMPT_CHAR_NG=$(str_with_color red ${PROMPT_CHAR_OK})
PROMPT='[${CURRENT_DIRECTORY}@${HOSTNAME}] $(my_git_status)
%(?.${PROMPT_CHAR_OK}.${PROMPT_CHAR_NG})'
