# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
#export UNCRUSTIFY_CONFIG=$HOME/.uncrustify.conf
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
#export JUNIT_HOME=/Library/JUNIT
#export CLASSPATH=$CLASSPATH:$JUNIT_HOME/junit-4.12.jar:$JUNIT_HOME/hamcrest-core-1.3.jar:.
#export PKG_CONFIG_PATH=/usr/local/Cellar/qt5/5.10.1/lib/pkgconfig/
#export QT_PKG_CONFIG_QT5CORE=$(find /usr -name Qt5Core.pc 2>/dev/null)

touch ~/.ssh/id_rsa
touch ~/.ssh/id_rsa.pub

## SHH AGENT CONFIG ##
key_file=~/.ssh/id_rsa
ssh-add > /dev/null 2>&1

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="davis"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=90
export GOPATH=/davis/code/go/


# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/opt/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/Users/ldavis1/anaconda/bin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/Applications/Xcode.app/Contents/Developer/usr/bin:/opt/iOSOpenDev/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/CrossPack-AVR/bin:/usr/local/gcc-arm-non-eabi/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source ~/.functions
source ~/.exports

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias ll="ls -l; echo -n 'total files'; ls -l | wc - l"
# alias la="ls -la; echo -n 'total files'; ls -la | wc - l"
#alias ls='exa'
alias ls='ls -GFh'
#alias ll='exa -GFhl'
alias ll='ls -GFhl'
#alias ssh='mosh'

# History {{{
unsetopt append_history # Allow multiple terminal sessions to all append to one zsh command history
unsetopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt extended_history # save timestamp of command and duration
unsetopt share_history # imports new commands and appends typed commands to history
#setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
#setopt hist_ignore_dups # Do not write events to history that are duplicates of previous events
#setopt hist_ignore_space # remove command line from history list when first character on the line is a space
#setopt hist_find_no_dups # When searching history don't display results already cycled through twice
#setopt hist_reduce_blanks # Remove extra blanks from each command line being added to history
#setopt hist_verify # don't execute, just expand history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
# }}}

# Preferred editor for local and remote sessions
export EDITOR='vim'

export JOHN=/usr/local/bin


code () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" --args "$F"
    fi
}


# -------------------------------------------------------------------
# Mac only
# -------------------------------------------------------------------
#if [[ $IS_MAC -eq 1 ]]; then
    alias ql='qlmanage -p 2>/dev/null' # OS X Quick Look
    alias oo='open .' # open current directory in OS X Finder
    # alias to show all Mac App store apps
    alias apps='mdfind "kMDItemAppStoreHasReceipt=1"'
    # refresh brew by upgrading all outdated casks
    alias refreshbrew='brew outdated | while read cask; do brew upgrade $cask; done'
    # rebuild Launch Services to remove duplicate entries on Open With menu
    alias rebuildopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.fram ework/Support/lsregister -kill -r -domain local -domain system -domain user'
#fi
export PATH="/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/opt/openssl/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"




export PATH="/usr/local/opt/openssl/bin:$PATH"
alias envtools='/davis/code/sf/om/Configuration/LocalConfig/envtools.sh'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

## EDITOR CONFIG ##
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

## INCLUDES ##
# source $HOME/.aliasrc
#source $HOME/.exportrc
source $HOME/.ssh/secrets
#source $ZSH/oh-my-zsh.sh
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/local/share/chruby/chruby.sh
#source /usr/local/share/chruby/auto.sh
#source $HOME/.aliasrc

