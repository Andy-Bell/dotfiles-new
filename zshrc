# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux brew z)

source $ZSH/oh-my-zsh.sh

# shortcut to this dotfiles path is $MYZSH
export LOCAL_ZSH=$HOME/.dotfiles-new

# your project folder that we can `c [tab]` to
export PROJECTS=~/dev

export GPG_TTY=$(tty)
export EDITOR=vim

# source every .zsh file in this rep
for config_file ($LOCAL_ZSH/**/*.zsh) source $config_file

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

export DOCKER_HOST='unix://~/.local/share/containers/podman/machine/qemu/podman.sock'

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.starship.toml
