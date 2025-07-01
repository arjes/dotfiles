#!/usr/bin/env bash

set -e

# Determine session name
get_session_name() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    # Try to get the last part of the remote URL
    remote_url=$(git remote get-url origin 2>/dev/null || echo "")
    if [[ $remote_url =~ /([^/]+)\.git$ ]]; then
      echo "${BASH_REMATCH[1]}"
      return
    fi
  fi

  # Fallback: use folder containing devbox.json
  if [ -f devbox.json ]; then
    echo "$(basename "$PWD")"
    return
  fi

  # Final fallback: hash of current path
  echo "devbox_$(basename "$PWD" | tr -c 'a-zA-Z0-9_' '_')"
}

SESSION_NAME=$(get_session_name)
PROJECT_DIR=$(pwd)

# Create a temp script that runs inside the devbox shell
TEMP_SCRIPT=$(mktemp)
cat > "$TEMP_SCRIPT" <<EOF
#!/usr/bin/env bash
set -e
if ! tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
  tmux new-session -d -s "$SESSION_NAME" -n "required_services" -c "$PROJECT_DIR" 'devbox services up'
  tmux new-window -t "$SESSION_NAME" -c "$PROJECT_DIR" 'nvim'
fi
tmux attach-session -t "$SESSION_NAME"
EOF

chmod +x "$TEMP_SCRIPT"

# Start devbox shell and run the script inside
$(
devbox shell
devbox run -- $SHELL "$TEMP_SCRIPT"
)

# Clean up
rm -f "$TEMP_SCRIPT"

