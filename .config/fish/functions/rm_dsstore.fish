# Defined in /var/folders/_b/xwyk6x1s12s2b527nbdrgh899gqlt8/T//fish.g10cnt/rm_dsstore.fish @ line 2
function rm_dsstore
    echo Files to be deleted:
    find . -name ".DS_Store"

    read --prompt 'set_color red; echo -n "Proceed (Y/[n])? "; set_color normal' proceed

    if test $proceed = 'Y'
        find . -name ".DS_Store" -delete
    else
        echo Aborting
    end
end
