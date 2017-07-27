# export
set -gx GOPATH $HOME
set -gx GHQ_ROOT $HOME/src

# PATH
set -gx PATH $GOPATH/bin $PATH

if test (uname) = 'Darwin'
  set -gx PATH $HOME/.Pokemon-Terminal $PATH
end

# keybind
function my_key_bindings
  fish_default_key_bindings -M insert
  fish_vi_key_bindings
  bind -M insert -m default fd force-repaint
  bind -M visual -m default fd force-repaint
end
set -g fish_key_bindings my_key_bindings
