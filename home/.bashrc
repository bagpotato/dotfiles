

# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return

HISTFILESIZE=100000
HISTSIZE=10000

shopt -s histappend
shopt -s extglob
shopt -s globstar
shopt -s checkjobs

alias -- cat=bat
alias -- edit-config='micro /etc/nixos/configuration.nix'
alias -- ll='eza -la --icons'
alias -- ls='eza --icons'
alias -- rebuild='sudo nixos-rebuild switch --flake /etc/nixos/'

if [[ ! -v BASH_COMPLETION_VERSINFO ]]; then
  . "/nix/store/l9lxggczxk1hf3cbx9ghzbkxdgpdq25r-bash-completion-2.18.0/etc/profile.d/bash_completion.sh"
fi

if test -n "$KITTY_INSTALLATION_DIR"; then
  export KITTY_SHELL_INTEGRATION="no-rc"
  source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"
fi

if [ -z "$NIXFETCH_SKIP" ]; then nixfetch; fi

if [[ $TERM != "dumb" ]]; then
  eval "$(/nix/store/dncwf5jhs0w08y7kxv5k5msmnscsa557-starship-1.26.0/bin/starship init bash --print-full-init)"
fi

