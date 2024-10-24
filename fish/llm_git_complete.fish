# -----------------------------------------------------------------------------
# AI-powered Git Commit Function
# Copy paste this gist into your ~/.bashrc or ~/.zshrc to gain the `lgcm` command. It:
# 1) gets the current staged changed diff
# 2) sends them to an LLM to write the git commit message
# 3) allows you to easily accept, edit, regenerate, cancel
# But - just read and edit the code however you like
# the `llm` CLI util is awesome, can get it here: https://llm.datasette.io/en/stable/

function lgcm
    # Function to generate commit message
    function generate_commit_message
        git diff --cached | llm '
Below is a diff of all staged changes, coming from the command:

```
git diff --cached
```

Please generate a concise, one-line commit message for these changes.' 2>/dev/null
    end

    # Function to handle Ctrl+C
    function handle_interrupt --on-event fish_cancel
        echo -e "\nCommit cancelled."
        return 1
    end

    # Main script
    echo "Generating AI-powered commit message..."
    set commit_message (generate_commit_message)

    while true
        echo -e "\nProposed commit message:"
        echo $commit_message

        read -l -P "Do you want to (a)ccept, (e)dit, (r)egenerate, or (c)ancel? (Ctrl+C to cancel) " choice

        switch $choice
            case a A
                if git commit -m "$commit_message"
                    echo "Changes committed successfully!"
                    return 0
                else
                    echo "Commit failed. Please check your changes and try again."
                    return 1
                end
            case e E
                read -l -P "Enter your commit message: " user_message
                if test -n "$user_message"; and git commit -m "$user_message"
                    echo "Changes committed successfully with your message!"
                    return 0
                else
                    echo "Commit failed. Please check your message and try again."
                    return 1
                end
            case r R
                echo "Regenerating commit message..."
                set commit_message (generate_commit_message)
            case c C
                echo "Commit cancelled."
                return 1
            case ''
                # This case handles the scenario when Ctrl+C is pressed
                # The read command will return an empty string
                return 1
            case '*'
                echo "Invalid choice. Please try again."
        end
    end
end
