#PROMPT='%{[$[31+$RANDOM % 6]m%}%B%U%m'"{%n}%#%{[m%}%u%b "
#RPROMPT='%{[$[31+$RANDOM % 6]m%}%B[%(?.%h.ERROR:%?)] %D{%m/%d %R} [%3c]%{[m%}%b'

function my_git_status() {
    [ $(current_branch) ] && echo "($(current_branch)$(git_prompt_status))"
}

PROMPT='%F{blue}[%~]%f $(my_git_status)
%(?.$.%F{red}$%f) '
