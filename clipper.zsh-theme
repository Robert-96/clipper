# Minimal theme for zsh with git support

function shorten {
    # Shorten the given string to a number of characters.

    string="$1"
    number="$2"

    len=${#string}

    if [[ $len -gt $number ]] && [[ $len -gt 0 ]]
    then
        string="${string:0:$number}..."
    fi

    echo $string
}

GIT_PORMPT_LENGTH=30

PROMPT='%{$fg[blue]%}[%c] $ %{$reset_color%}'
RPROMPT='%{$fg[blue]%}$(shorten $(git_prompt_info) ${GIT_PORMPT_LENGTH})%{$reset_color%} $(git_prompt_status)'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED=" %{$fg_bold[green]%}ADD%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$fg_bold[yellow]%}MOD%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$fg_bold[yellow]%}REN%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$fg_bold[red]%}DEL%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$fg_bold[magenta]%}UNM%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg_bold[cyan]%}UNT%{$reset_color%}"
