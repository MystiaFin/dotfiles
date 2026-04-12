### General Settings
set -g fish_greeting ""

### Key Aliases
alias ll="lsd -l"
alias ls="lsd"
alias la="lsd -a"
alias lla="lsd -la"
alias vim="nvim"
alias vi="nvim"

# Translation of the 'nrs' flake logic for Arch (optional/manual)
# Since you aren't on NixOS, this command won't work, but here is the syntax:
# alias nrs="sudo nixos-rebuild switch --flake .#your-device"

### Interactive Shell Init
# Force block cursor
printf '\e[2 q'
function force_cursor_block --on-event fish_prompt
    printf '\e[2 q'
end

# Catppuccin-esque Colors (The Catppuccin Mocha palette from your Nix config)
set -g fish_color_normal cdd6f4
set -g fish_color_command f9e2af --bold
set -g fish_color_keyword f9e2af
set -g fish_color_quote a6e3a1
set -g fish_color_redirection 94e2d5
set -g fish_color_end f5c2e7
set -g fish_color_error f38ba8
set -g fish_color_param f2cdcd
set -g fish_color_comment 6c7086
set -g fish_color_autosuggestion 6c7086

### Direnv Hook
# Make sure you have 'direnv' installed via pacman
if type -q direnv
    direnv hook fish | source
end

fish_add_path /home/mystiafin/.spicetify
