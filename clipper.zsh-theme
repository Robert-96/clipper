# Clipper is a minimalist zsh theme with git support. It displays pwd, status code and git status & branch.


shorten() {
    # Shorten the given string to a given number of characters.

    if [[ $# -eq 2 ]]
    then
        string="$1"
        max_len="$2"

        len=${#string}

        if [[ $len -gt 0 && $len -gt $max_len ]]
        then
            string="${string:0:$max_len}..."
        fi

        echo $string
    else
        echo ""
    fi
}


clipper_pwd() {
    # Retruns the pwd.

    echo "%{$fg[blue]%}[%c]%{$reset_color%}"
}


clipper_prompt_symbol() {
    # Color the prompt symbol based on the status code of the previous command, green if the command was successful
    # (returned a status code of 0) red otherwise.

    echo "%(?.%{$fg[green]%}.%{$fg[red]%})$%{$reset_color%}"
}


clipper_git_info() {
    # Returns a shorter version of the git_prompt_info (which displays the current branch name).

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

PROMPT='$(clipper_pwd) $(clipper_prompt_symbol) '
RPROMPT='$(clipper_git_info) $(git_prompt_status)'
