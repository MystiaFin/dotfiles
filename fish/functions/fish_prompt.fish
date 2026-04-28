function fish_prompt
    set -l last_status $status

    # Standard terminal colors (adapts dynamically to your terminal theme)
    set -l border_color (set_color brblack)    # Bright black (usually dark gray)
    set -l path_color (set_color --bold white) # Standard bold white
    set -l git_color (set_color yellow)        # Standard yellow
    set -l success_color (set_color green)     # Standard green
    set -l error_color (set_color red)         # Standard red
    set -l normal (set_color normal)

    # Top line
		echo -n ""
    echo -n $border_color"╭─  "
    echo -n $path_color"["(prompt_pwd)"]"

    # Git integration
    if type -q git
        set -l git_branch (git branch --show-current 2>/dev/null)
        
        if test -n "$git_branch"
            echo -n $border_color"("$git_color$git_branch$border_color")"
            set -l dirty (git status --porcelain --ignore-submodules=dirty 2>/dev/null)
            if test -n "$dirty"
                echo -n $error_color"*"$normal
            end
        end
    end

    echo # New line
    
    # Bottom line
    echo -n $border_color"╰─ "

    if test $last_status -eq 0
        echo -n $success_color"λ "$normal
    else
        echo -n $error_color"λ "$normal
    end
end
