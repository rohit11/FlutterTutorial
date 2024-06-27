```
commit_changes() {
    local ROOT_DIR=$1
    local COMMIT_MESSAGE=$2
    cd "$ROOT_DIR" || {
        echo "Failed to change directory to $ROOT_DIR"
        exit 1
    }

    # List tracked and modified files for commit
    local MODIFIED_FILES=$(git ls-files --modified --exclude-standard)
    if [ -z "$MODIFIED_FILES" ]; then
        echo "No changes to commit."
        return
    fi

    echo "Modified files:"
    for file in $MODIFIED_FILES; do
        echo "File: $file"
        git --no-pager diff "$file"
        echo ""

        # If AUTO_YES is set to true and the file matches specified patterns, auto stage it
        if [[ "$AUTO_YES" == true ]] && [[ "$file" =~ "package.json" || "$file" == "yarn.lock" || "$file" =~ ".yml" ]]; then
            git add "$file"
            echo "Added $file to staging area."
        else
            # Prompt for each file to add it to the staging area or not
            read -r -p "Do you want to stage this file for commit? [y/N] " response
            if [[ "$response" =~ ^[Yy]$ ]]; then
                git add "$file"
                echo "Added $file to staging area."
            else
                echo "Skipped $file."
            fi
        fi
    done

    # Commit if any files are staged
    if git diff --cached --quiet; then
        echo "No files staged for commit. Exiting."
        return
    else
        git commit -m "$COMMIT_MESSAGE" || {
            echo "Failed to commit changes."
            exit 1
        }
        echo "Committed changes to Git with message: $COMMIT_MESSAGE"
    fi
}
```
