function fish_prompt
    set -l last_status $status

    # Colors
    set -l path_blue (set_color --bold 89b4fa)
    set -l git_red (set_color f38ba8)
    set -l green (set_color a6e3a1)
    set -l text (set_color cdd6f4)
    set -l normal (set_color normal)

    # Top line
    echo -n $text"╭─  "
    echo -n $path_blue"["(prompt_pwd)"]"

    # Git integration
    if type -q git
        set -l git_branch (git branch --show-current 2>/dev/null)
        
        if test -n "$git_branch"
            echo -n $text"("$git_red$git_branch$text")"
            set -l dirty (git status --porcelain --ignore-submodules=dirty 2>/dev/null)
            if test -n "$dirty"
               echo -n $git_red"*"$normal
            end
        end
    end

    echo # New line
    
    # Bottom line
    echo -n $text"╰─ "

    if test $last_status -eq 0
        echo -n $green"λ "$normal
    else
        echo -n $git_red"λ "$normal
    end
end
