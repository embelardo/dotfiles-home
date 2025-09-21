# Zsh Init ####################################################################

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

source $HOME/.zshrc_theme

plugins=(
    aliases                  # List available aliases grouped by plugin.
    alias-finder             # Search defined aliases and output matches.
    colored-man-pages        # Add colors to man pages.
    dirhistory               # Add shortcuts to navigate folder history and hierarchy.
    git                      # Add git aliases and functions.
    gradle                   # Add completions and aliases for Gradle.
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
alias tmp='cd ~/tmp'
alias workspaces='cd ~/workspaces'

alias ctfiyh='cd ~/dev/code-that-fits-in-your-head'
alias corejava='cd ~/dev/core-java'
alias gopl='cd ~/dev/gopl.io'
alias hol='cd ~/dev/hotspot-optimizer-library'

alias af='alias-finder --longer'
alias h='history -t "%Y.%m.%d %H:%M:%S"'
alias hr='fc -R'
alias hw='fc -W'
alias linkm='ln -s ~/dev/dotfiles-home/auto/makefile makefile'
alias m='make'

alias szsh="source ${ZSHRC}"

# History #####################################################################

HISTORY_IGNORE="(b|cd|dev|doc|downloads|dotfiles|grepo|h|hr|hw|linkm|ll*|la*|m"
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

# Compleat ####################################################################

autoload -Uz compinit bashcompinit
compinit
bashcompinit

source ~/.local/share/bash-completion/completions/compleat_setup

# Bat #########################################################################

#if [ `uname -s` = "Linux" ]; then
#    alias bat='batcat'
#fi

#export BAT_THEME="Solarized (dark)"

# Git #########################################################################

export GIT_PAGER="cat"

# iTerm2 ######################################################################

#source ~/.iterm2_shell_integration.zsh

# Python ######################################################################

PYENV_ROOT="$HOME/.pyenv"
if [[ -d $PYENV_ROOT/bin ]];
then
    if echo ${PATH} | grep ${PYENV_ROOT}/bin  > /dev/null
    then
        echo "PATH already contains '${PYENV_ROOT}/bin'. No need to add."
    else
        echo "Adding ${PYENV_ROOT}/bin to PATH."
        export PATH="$PYENV_ROOT/bin:$PATH"
        export PYENV_ROOT
        eval "$(pyenv init -)"
    fi
fi

# Sdkman ######################################################################

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Scala CLI ###################################################################

SCALA_VERSION="1.9.1"
SCALACLI_HOME="$HOME/.sdkman/candidates/scalacli/${SCALA_VERSION}"
if [[ -d $SCALACLI_HOME/bin ]];
then
    if echo ${PATH} | grep ${SCALACLI_HOME}/bin  > /dev/null
    then
        echo "PATH already contains '${SCALACLI_HOME}/bin'. No need to add."
    else
        echo "Adding ${SCALACLI_HOME}/bin to PATH."
        # Add Scala CLI to PATH.
        export PATH="$SCALACLI_HOME/bin:$PATH"
        # Enable Scala CLI completions.
        fpath=("/home/miko/.local/share/scalacli/completions/zsh" $fpath)
        compinit
    fi
fi

# PATH ########################################################################

MIKO_LOCAL_BIN=~/.local/bin
if echo ${PATH} | grep ${MIKO_LOCAL_BIN}  > /dev/null
then
    echo "PATH already contains '${MIKO_LOCAL_BIN}'. No need to add."
else
    echo "Adding ${MIKO_LOCAL_BIN} to PATH."
    export PATH=${MIKO_LOCAL_BIN}:${PATH}
fi

GOLANG_BIN=/usr/local/go/bin
if echo ${PATH} | grep ${GOLANG_BIN}  > /dev/null
then
    echo "PATH already contains '${GOLANG_BIN}'. No need to add."
else
    echo "Adding ${GOLANG_BIN} to PATH."
    export PATH=${GOLANG_BIN}:${PATH}
fi

RUSTUP_FOLDER=~/.rustup
if [ -d "${RUSTUP_FOLDER}" ];
then
    echo "Folder ${RUSTUP_FOLDER} exists. Sourcing Rust environment."
    source "$HOME/.cargo/env"
fi

SCALA_BIN=~/.local/share/coursier/bin
if echo ${PATH} | grep ${SCALA_BIN}  > /dev/null
then
    echo "PATH already contains '${SCALA_BIN}'. No need to add."
else
    echo "Adding ${SCALA_BIN} to PATH."
    export PATH=${SCALA_BIN}:${PATH}
fi

DART_PATH=/opt/dart/dart-sdk/bin
if echo ${PATH} | grep ${DART_PATH}  > /dev/null
then
    echo "PATH already contains '${DART_PATH}'. No need to add."
else
    echo "Adding ${DART_PATH} to PATH."
    export PATH=${DART_PATH}:${PATH}
fi

RBENV_FOLDER=~/.rbenv
if [ -d "${RBENV_FOLDER}" ];
then
    echo "Folder ${RBENV_FOLDER} exists. Sourcing rbenv."
    export PATH="${RBENV_FOLDER}/bin:$PATH"
    eval "$(rbenv init -)"
fi

# Functions ###################################################################

AUTO=~/auto
COMPLEAT=~/.compleat
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

    if [ -f "${COMPLEAT}" ]; then
        echo "File ${COMPLEAT} exists."
    else
        echo "Creating link ${COMPLEAT}."
        ln -s ${DOTFILES}/compleat ${COMPLEAT}
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

# nvm #########################################################################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# eof
