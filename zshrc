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

alias la='ls -la'
alias ll='ls -l'
alias lrt='ls -lrt'

alias b='cd ..'
alias bb='cd ../..'
alias bbb='cd ../../..'
alias bbbb='cd ../../../..'
alias bbbbb='cd ../../../../..'

alias dev='cd ~/dev'
alias doc='cd ~/doc'
alias downloads='cd ~/Downloads'
alias dotfiles='cd ~/miko/dev/dotfiles-home'
alias ref='cd ~/ref'
alias pluralsight='cd ~/pluralsight'
alias workspaces='cd ~/workspaces'

alias r='source ~/.zshrc'

# Bat #########################################################################

export BAT_THEME="Solarized (dark)"

# Git #########################################################################

export GIT_PAGER="cat"

# History #####################################################################

HISTORY_IGNORE="b|cd|dev|doc|downloads|dotfiles|ll|la|m|r|ref|pluralsight|workspaces"
export HISTORY_IGNORE="${HISTORY_IGNORE}"

export HISTFILE=~/.zsh_history   # Name history file
export HISTSIZE=1000000000       # Number of lines to keep in one session
export SAVEHIST=1000000000       # Number of lines history to save
export HISTTIMEFORMAT="[%F %T] " # Ex: 18.12.2021 06:49

setopt EXTENDED_HISTORY          # Saves time command started and how long it ran
setopt HIST_SAVE_NO_DUPS         # Do not save duplicate line more than once
setopt HIST_FIND_NO_DUPS         # If duplicate lines saved, don't duplicate them in backward search
setopt HIST_IGNORE_ALL_DUPS      # Disregard line if already in history
setopt HIST_IGNORE_SPACE         # Disregard line if it begins with space
setopt HIST_NO_STORE             # Disregard history or fc command
setopt HIST_REDUCE_BLANKS        # Remove excess blanks before saving line
setopt INC_APPEND_HISTORY        # Add line to history upon execution instead of upon exit

unsetopt HIST_IGNORE_DUPS        # Unset option set by unknown actor
unsetopt HIST_EXPIRE_DUPS_FIRST  # Unset option set by unknown actor
unsetopt SHARE_HISTORY

# Sdkman ######################################################################

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# eof #########################################################################