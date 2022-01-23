set fish_greeting                                   # Supress intro message
set -x MANPAGER "nvim -c 'set ft=man' -"            # nvim as manpager
starship init fish | source                         # Starship prompt
fzf_configure_bindings --directory=\ct              # Ctrl+t to find file
bind -M insert \cf accept-autosuggestion
