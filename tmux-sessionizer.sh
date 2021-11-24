#!/usr/bin/env bash

#assumes you are already in tmux
session=$(find ~ ~/src ~/src/classes ~/src/notes ~/src/personal ~/src/rover -type d -maxdepth 1 | grep -v "/\." | fzf);
session_name=$(basename "$session" | tr . _)

if ! tmux has-session -t "$session_name"; then
  tmux new-session -s "$session_name" -c "$session" -d
fi

tmux switch-client -t "$session_name"