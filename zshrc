#----------------------------------------------------------------------------------------------------------------#
# Zsh configuration
#----------------------------------------------------------------------------------------------------------------#
# Zsh - hide messages
# refer: https://stackoverflow.com/questions/61554566/how-to-avoid-bunch-of-oh-my-zsh-messages-showing-whenever-i-open-iterm-termi
ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH="/Users/sbaranidharan/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Zsh - command auto-correction.
ENABLE_CORRECTION="true"

# Zsh - Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Zsh - other settings to load faster
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Zsh Plugins
plugins=(brew osx colored-man-pages last-working-dir) 	# Standard & OSX plugins
plugins+=(git)                                          # Git
plugins+=(zsh-autosuggestions)				# Hide-able autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
plugins+=(zsh-syntax-highlighting)                      # Highlight terminal commands for correctness on-the-fly
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
plugins+=(zsh-nvm)					# zsh based nvm to switch between node versions
# git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
plugins+=(rand-quote)       # type `quote` to get new quotes - https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rand-quote
plugins+=(history-search-multi-word)			# zsh history search --> https://github.com/zdharma/history-search-multi-word
# cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zdharma/history-search-multi-word.git
# before this you need to run `git clone https://github.com/b4b4r07/enhancd ~/.oh-my-zsh/custom/plugins/enhanced`
# and `brew install peco`
source ~/.oh-my-zsh/custom/plugins/enhanced/init.sh

source $ZSH/oh-my-zsh.sh

# Colorize terminal output
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# To display git branch details
# https://github.com/ohmyzsh/ohmyzsh/issues/5686
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# this ret_status is used in PROMT to decide whether to print the git details or not
local ret_status="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%}➜ )"

# Zsh Promt (Bash PS1 equivalent)
# Using 256-bit ANSI codes
# check section "Up to 256 colors" in https://blog.balthazar-rouberol.com/customizing-your-shell.html
# To generate online: https://zsh-prompt-generator.site/
PROMPT='${ret_status} %! %F{white}➜ [%F{white}%F{yellow}%W%f %F{yellow}%t%f] %F{cyan}%~%f ➜ $(git_prompt_info) %F{white}$%f '

#----------------------------------------------------------------------------------------------------------------#
# User configuration
#----------------------------------------------------------------------------------------------------------------#

# aliasing cat to "pygmentize -g" so that the output will have syntax hightlighted
# https://dev.to/rogiervandenberg/add-syntax-highlighting-to-cat-in-your-terminal-1kcp
# https://stackoverflow.com/questions/65579985/zsh-shell-alias
richcat() {
    pygmentize -g $1 | nl -b a | less -Rai
}

# Java switch between different JVMs
alias java8="export JAVA_HOME=$(/usr/libexec/java_home -v1.8)"
alias java15="export JAVA_HOME=$(/usr/libexec/java_home -v15.0.1)"

# locate updatedb shortcut
alias updatedb="sudo /usr/libexec/locate.updatedb"

# Cassandra start & stop commands
alias cassandrastart='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.cassandra.plist'
alias cassandrastop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.cassandra.plist'

# Redis start & stop commands
alias redisstart='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist'
alias redisstop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist'
