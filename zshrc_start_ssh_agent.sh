#!/bin/bash
# SSH Agent startup script

SSH_ENV="$HOME/.ssh/agent_environment"

function start_agent {
    echo "Starting new SSH Agent..."
    ssh-agent -s | sed 's/^echo/#echo/' > "$SSH_ENV"
    echo "SSH Agent started successfully"
    chmod 600 "$SSH_ENV"
    source "$SSH_ENV" > /dev/null
    ssh-add ~/.ssh/id_rsa  # Add your key paths here
}

# Check if agent environment file exists and source it
if [ -f "$SSH_ENV" ]; then
    source "$SSH_ENV" > /dev/null
    # Check if the agent is still running
    kill -0 "$SSH_AGENT_PID" 2>/dev/null || {
        echo "SSH Agent process not found, starting new one..."
        start_agent
    }
else
    start_agent
fi
