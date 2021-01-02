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
plugins+=(npm)						                              # JavaScript plugins
plugins+=(zsh-autosuggestions)				                  # Hide-able autosuggestions
plugins+=(zsh-syntax-highlighting)                      # Highlight terminal commands for correctness on-the-fly

source $ZSH/oh-my-zsh.sh

# Colorize terminal output
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# # Zsh Promt (Bash PS1 equivalent)
# # Using 256-bit ANSI codes
# # check section "Up to 256 colors" in https://blog.balthazar-rouberol.com/customizing-your-shell.html
# To generate online: https://zsh-prompt-generator.site/
PROMPT="%! ➜ [%F{yellow}%W%f%F{yellow}%t%f] %F{cyan}%~%f %F{white}$%f "

#----------------------------------------------------------------------------------------------------------------#
# User configuration
#----------------------------------------------------------------------------------------------------------------#

# Aliasing aws_sso to Azure login
alias aws_sso="aws-azure-login --profile saml"

# Setting default AWS profile
export AWS_PROFILE=saml

# Dev ssh command
alias dev="ssh sbaranidharan@dev.mycompany.com"

# Java switch between different JVMs
alias java8="export JAVA_HOME=$(/usr/libexec/java_home -v1.8)"
alias java15="export JAVA_HOME=$(/usr/libexec/java_home -v15.0.1)"

# Cassandra start & stop commands
alias cassandrastart='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.cassandra.plist'
alias cassandrastop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.cassandra.plist'

# Redis start & stop commands
alias redisstart='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist'
alias redisstop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist'
