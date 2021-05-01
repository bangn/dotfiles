''
  ################################################################################
  # Plugins
  ################################################################################
  set -g @plugin "arcticicestudio/nord-tmux"

  ################################################################################
  # Config
  ################################################################################
  set-option -g focus-events on
  set-option -sa terminal-overrides ',screen-256color:RGB'

  ########################################
  # Reload the config.
  ########################################
  bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded .tmux.conf"

  ########################################
  # Saner splitting.
  ########################################
  unbind '"'
  bind | split-window -h -c "#{pane_current_path}" # horizontal split
  bind - split-window -v -c "#{pane_current_path}" # vertical split

  ########################################
  # Renumber windows
  ########################################
  set-option -g renumber-windows on

  ########################################
  # Don't allow the terminal to rename windows
  ########################################
  set-window-option -g allow-rename off

  ########################################
  # Status bar
  ########################################
  set -g status-interval 60
  set-option -g status-interval 1

  ########################################
  # Display activity from other windows
  ########################################
  setw -g monitor-activity off
  set -g visual-activity off

  ########################################
  # Copy/paste interop
  ########################################
  bind-key -T copy-mode-vi 'v' send -X begin-selection
  bind-key -T copy-mode-vi 'V' send -X select-line
  bind-key -T copy-mode-vi 'r' send -X rectangle-toggle

  if-shell -b 'uname | grep -q Linux' \
    'bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -i -f -selection primary | xclip -i -selection clipboard"'

  if-shell -b 'uname | grep -q Darwin' \
    'bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"'

  ########################################
  # Toggle mouse on with ^A m
  ########################################
  bind m \
    set -g mouse on \;\
    display 'Mouse: ON'

  ########################################
  # Toggle mouse off with ^A M
  ########################################
  bind M \
    set -g mouse off \;\
    display 'Mouse: OFF'

  ########################################
  # Allow scrolling with mouse
  ########################################
  bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
  bind -n WheelDownPane select-pane -t= \; send-keys -M

  ########################################
  # Useful stuff
  ########################################

  ####################
  # prefix + z: maximize current pane. Do it again to toggle back
  ####################
  bind = select-layout even-vertical

  ####################
  # Vim style pane selection
  ####################
  is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
      | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|\.?n?vim?x?(-wrapped)?)(diff)?$'"

  is_fzf="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?fzf$'"

  bind -n C-h run "($is_vim && tmux send-keys C-h) || \
                   tmux select-pane -L"

  bind -n C-j run "($is_vim && tmux send-keys C-j)  || \
                   ($is_fzf && tmux send-keys C-j) || \
                   tmux select-pane -D"

  bind -n C-k run "($is_vim && tmux send-keys C-k) || \
                   ($is_fzf && tmux send-keys C-k)  || \
                   tmux select-pane -U"

  bind -n C-l run "($is_vim && tmux send-keys C-l) || \
                   tmux select-pane -R"

  bind C-\\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
  bind C-l send-keys 'C-l' # Alternate mapping to clear-screen
  bind C-R send-keys -R # Clear server screen

  ################################################################################
  # https://github.com/SixArm/tmux-conf/blob/master/sources/select-window-via-meta-number.conf
  ################################################################################

  ########################################
  # Shortcuts M-[0-9] to switch to window [0-9].
  # These are a bit faster to use than C-b [0-9].
  ########################################
  bind -n M-0 select-window -t :0
  bind -n M-1 select-window -t :1
  bind -n M-2 select-window -t :2
  bind -n M-3 select-window -t :3
  bind -n M-4 select-window -t :4
  bind -n M-5 select-window -t :5
  bind -n M-6 select-window -t :6
  bind -n M-7 select-window -t :7
  bind -n M-8 select-window -t :8
  bind -n M-9 select-window -t :9

  ################################################################################
  # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
  ################################################################################
  run '~/.tmux/plugins/tpm/tpm'

  ################################################################################
  # Patch color for tmux 3.2
  # https://github.com/arcticicestudio/nord-tmux/pull/34/
  ################################################################################
  set -g status-style bg=black,fg=white
  set -g message-style bg=brightblack,fg=cyan
  set -g message-command-style bg=brightblack,fg=cyan

  ################################################################################
  # Patch nord-tmux window-status
  ################################################################################
  set -g status-right '''
  set -g status-left "#[fg=black,bg=blue,bold] #S #[fg=blue,bg=black,nobold,noitalics,nounderscore]"
  set -g window-status-separator '''
  set -g window-status-format '#[fg=black,bg=cyan,nobold,noitalics,nounderscore] #[fg=black,bg=cyan]#I  #(pwd="#{pane_current_path}"; echo ''${pwd####*/})#F #[fg=cyan,bg=black,nobold,noitalics,nounderscore]'
  set -g window-status-current-format '#[fg=black,bg=cyan,nobold,noitalics,nounderscore] #[fg=black,bg=cyan]#I  #(pwd="#{pane_current_path}"; echo ''${pwd####*/})#F #[fg=cyan,bg=black,nobold,noitalics,nounderscore]'
''
