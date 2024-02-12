# grep-replace {from_string} {to_string} {directory} 
function grep-replace() {
    echo "$1"
    echo "$3"
    success=$(grep --color=auto -r "$1" "$3")
    if [[ $success = "" ]]
    then
        return
    fi
    grep --color=auto -r "$1" "$3"
    echo "Are you sure [y/n]"
    read var
    if [ $var = "y" ]
    then
        grep --color=auto -rl "$1" "$3" | xargs sed -i 's/'"$1"'/'"$2"'/g'
    fi
}
