hello() {
    echo "Hello ${1}!"
}

clone() {
    # echo $PATH
    #echo $(which bash)
    gh repo clone ${1}
    # echo "cloned ${1}"
}