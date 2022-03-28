# Clipper is a minimalist zsh theme with git support. It displays pwd, status code and git status & branch.

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

function clipper_prompt_symbol {
    # Color the prompt symbol based on the status code of the previous command, green if the command was successful
    # (returned a status code of 0) red otherwise.

    echo "%(?.%{$fg[green]%}.%{$fg[red]%})$%{$reset_color%}"
}

function clipper_git_info {
    length=30

    echo "%{$fg[blue]%}$(shorten $(git_prompt_info) ${length})%{$reset_color%}"
}

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

PROMPT='%{$fg[blue]%}[%c]%{$reset_color%} $(clipper_prompt_symbol) '
RPROMPT='$(clipper_git_info) $(git_prompt_status)'
