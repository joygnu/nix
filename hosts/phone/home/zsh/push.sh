#!/bin/bash

# Function to push to all remotes
push_to_all_remotes() {
    # Get a list of all remotes
    remotes=$(git remote)

    # Check if there are no remotes
    if [ -z "$remotes" ]; then
        echo "No remotes found."
        exit 1
    fi

    # Loop through each remote and push
    for remote in $remotes; do
        echo "Pushing to remote '$remote'..."
        git push "$remote" --all
        git push "$remote" --tags
        echo "Push to remote '$remote' completed."
    done
}

# Execute the function
push_to_all_remotes

