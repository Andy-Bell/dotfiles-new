# shortcut to this dotfiles path is $MYZSH
export ZSH=$HOME/.dotfiles-new

# your project folder that we can `c [tab]` to
export PROJECTS=~/dev

export GPG_TTY=$(tty)
export EDITOR=vim

# source every .zsh file in this rep
for config_file ($ZSH/**/*.zsh) source $config_file

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

export DOCKER_HOST='unix://~/.local/share/containers/podman/machine/qemu/podman.sock'

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.starship.toml