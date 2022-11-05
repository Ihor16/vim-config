#!/bin/bash

# prints error and exits the script if the given variable is empty
# $1 - variable to check
# $2 - meaning of the variable
checkVar() {
    if [[ -z $1 ]]; then
        echo -e "\nError: invalid number for $2";
        exit 1
    fi
}

# $1 - file name
createBasic() {
    truncate -s 0 "$1"
    paths=$(realpath ./configs/basic*)
    for p in $paths; do
        echo "source $p" >> "$1"
    done
}

# $1 - file name
createAdvanced() {
    truncate -s 0 "$1"
    paths=$(realpath ./configs/{basic.vim,advanced.vim})
    for p in $paths; do
        echo "source $p" >> "$1"
    done
}

PS3="Which file do you want to create?: "
select file in vimrc init.vim; do
    checkVar "$file" "file name"
    echo -e "$file\n"
    break
done

PS3="Which configuration do you want to have?: "
select conf in basic advanced; do
    checkVar "$conf" "configuration"
    echo -e "$conf\n"
    break
done

case "$conf" in
    "basic") createBasic "$file" ;;
    "advanced") createAdvanced "$file" ;;
    *) ;;
esac

echo "Done!"
