# Zsh Init ####################################################################

# Path to your oh-my-zsh installation.
export ZSH="/Users/miko/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

source /Users/miko/.zshrc_theme

plugins=(
    aliases                  # List available shortcuts grouped by plugin.
    alias-finder             # Searches defined aliases and outputs matches.
    colored-man-pages        # Add colors to man pages.
    git
    gradle                   # This plugin adds completions and aliases for Gradle.
    zsh-autosuggestions      # Fish-like fast/unobtrusive autosuggestions for zsh.
    zsh-syntax-highlighting  # Fish-like syntax highlighting for zsh.
)

source $ZSH/oh-my-zsh.sh

# Plugin Configs ##############################################################

# Colorize (ccat, cless)
ZSH_COLORIZE_STYLE="solarized-dark"

# Aliases #####################################################################

DOTFILES=~/dev/dotfiles-home
ZSHRC=~/.zshrc

alias la='ls -la'
alias lart='ls -lart'
alias ll='ls -l'
alias lrt='ls -lrt'

alias b='cd ..'
alias bb='cd ../..'
alias bbb='cd ../../..'
alias bbbb='cd ../../../..'
alias bbbbb='cd ../../../../..'

alias auto='cd ~/auto'
alias dev='cd ~/dev'
alias doc='cd ~/doc'
alias dotfiles="cd ${DOTFILES}"
alias downloads='cd ~/Downloads'
alias grepo='cd ~/git-repos'
alias pluralsight='cd ~/pluralsight'
alias ref='cd ~/ref'
alias workspaces='cd ~/workspaces'

alias af='alias-finder --longer'
alias h='history -t "%Y.%m.%d %H:%M:%S"'
alias linkm='ln -s ~/auto/makefile makefile'
alias m='make'
alias wh='fc -W'

alias szrc="source ${ZSHRC}"

# History #####################################################################

HISTORY_IGNORE="(b|cd|dev|doc|downloads|dotfiles|grepo|h|linkm|ll*|la*|m"
HISTORY_IGNORE="${HISTORY_IGNORE}|pluralsight|r|ref|szrc|tmp|workspaces)"
export HISTORY_IGNORE="${HISTORY_IGNORE}"

export HISTFILE=~/.zsh_history   # Name history file
export HISTSIZE=1000000000       # Number of lines to keep in one session
export SAVEHIST=1000000000       # Number of lines history to save
export HISTTIMEFORMAT="[%F %T] " # Ex: 18.12.2021 06:49

setopt EXTENDED_HISTORY          # Saves time command started and how long it ran
setopt HIST_SAVE_NO_DUPS         # Do not save duplicate line more than once
setopt HIST_FIND_NO_DUPS         # If duplicate lines saved, don't duplicate them in backward search
setopt HIST_IGNORE_SPACE         # Disregard line if it begins with space
setopt HIST_NO_STORE             # Disregard history or fc command
setopt HIST_REDUCE_BLANKS        # Remove excess blanks before saving line
setopt INC_APPEND_HISTORY        # Add line to history upon execution instead of upon exit

unsetopt HIST_FIND_NO_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
unsetopt HIST_IGNORE_DUPS
unsetopt HIST_EXPIRE_DUPS_FIRST
unsetopt SHARE_HISTORY

# iTerm2 ######################################################################

 source ~/.iterm2_shell_integration.zsh

# Bat #########################################################################

export BAT_THEME="Solarized (dark)"

# Git #########################################################################

export GIT_PAGER="cat"

# Sdkman ######################################################################

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Functions ###################################################################

AUTO=~/auto
JRNL_YML=~/.config/jrnl/jrnl.yaml
MAKEFILE=~/makefile
TMUX_CONF=~/.tmux.conf
ZSHRC_THEME=~/.zshrc_theme

init-home () {
    if [ -d "${DOTFILES}" ]; then
        echo "Folder ${DOTFILES} exists."
    else
        echo "Cloning ${DOTFILES} repo."
        git clone https://github.com/embelardo/dotfiles-home.git ${DOTFILES}
    fi

    if [ -f "${ZSHRC}" ]; then
        echo "File ${ZSHRC} exists."
    else
        echo "Creating link ${ZSHRC}."
        ln -s ${DOTFILES}/zshrc ${ZSHRC}
    fi

    if [ -f "${ZSHRC_THEME}" ]; then
        echo "File ${ZSHRC_THEME} exists."
    else
        echo "Creating link ${ZSHRC_THEME}."
        ln -s ${DOTFILES}/zshrc_theme ${ZSHRC_THEME}
    fi

    if [ -d "${AUTO}" ]; then
        echo "Folder ${AUTO} exists."
    else
        echo "Creating link ${AUTO}."
        ln -s ${DOTFILES}/auto ${AUTO}
    fi

    if [ -f "${JRNL_YML}" ]; then
        echo "File ${JRNL_YML} exists."
    else
        echo "Creating link ${JRNL_YML}."
        mkdir -p ~/.config/jrnl
        ln -s ${DOTFILES}/jrnl.yaml ${JRNL_YML}
    fi

    if [ -f "${MAKEFILE}" ]; then
        echo "File ${MAKEFILE} exists."
    else
        echo "Creating link ${MAKEFILE}."
        ln -s ${AUTO}/makefile ${MAKEFILE}
    fi

    if [ -f "${TMUX_CONF}" ]; then
        echo "File ${TMUX_CONF} exists."
    else
        echo "Creating link ${TMUX_CONF}."
        ln -s ${DOTFILES}/tmux.conf ${TMUX_CONF}
    fi
}

# eof #########################################################################
