function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

    if not set -q __fish_git_prompt_show_informative_status
        set -g __fish_git_prompt_show_informative_status 1
    end
    if not set -q __fish_git_prompt_showuntrackedfiles
        set -g __fish_git_prompt_showuntrackedfiles 1
    end
    if not set -q __fish_git_prompt_color_branch
        set -g __fish_git_prompt_color_branch magenta --bold
    end
    if not set -q __fish_git_prompt_showupstream
        set -g __fish_git_prompt_showupstream informative
    end
    if not set -q __fish_git_prompt_color_dirtystate
        set -g __fish_git_prompt_color_dirtystate blue
    end
    if not set -q __fish_git_prompt_color_stagedstate
        set -g __fish_git_prompt_color_stagedstate yellow
    end
    if not set -q __fish_git_prompt_color_invalidstate
        set -g __fish_git_prompt_color_invalidstate red
    end
    if not set -q __fish_git_prompt_color_untrackedfiles
        set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
    end
    if not set -q __fish_git_prompt_color_cleanstate
        set -g __fish_git_prompt_color_cleanstate green --bold
    end

    set -l color_cwd
    set -l suffix
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        else
            set color_cwd $fish_color_cwd
        end
        set suffix '#'
    else
        set color_cwd $fish_color_cwd
        set suffix '$'
    end

    # AWS_PROFILE
    if set -q AWS_PROFILE
        set_color -b FF9900 black
        # set_color -o FF9900
        echo -n $AWS_PROFILE
        set_color normal
        echo -n " "
    end

    # When working inside a host, it's helpful to print date and hostname (default false)
    set -f host_prompt 0
    if test $host_prompt = 1
        # Print date
        printf '[%s] ' (date "+%Y-%m-%d %H:%M:%S")
        # Print hostname
        printf '%s%s%s\n> ' (set_color yellow) (prompt_hostname) (set_color normal)
    end

    # PWD
    set_color $color_cwd
    echo -n (prompt_pwd)
    set_color normal

    printf '%s ' (fish_vcs_prompt)

    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color --bold $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)
    echo -n $prompt_status
    set_color normal

    echo -n "$suffix "
end
