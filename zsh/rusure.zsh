function preexec_rusure() {
    echo $*
}

add-zsh-hook preexec preexec_rusure
