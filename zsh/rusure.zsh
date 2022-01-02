#!/bin/zsh


config_path=${0:A:h}/config.yml
cmds=("rm -rf /" "git checkout ." "git co ." "xzp")
ask="This is a dangerous operation,are you sure?"
yes='Y'
no='N'

function rusure_exec(){

    printf "${ask}(${yes}/${no}):"
    read result
    if [[ ${result:l} == 'y' ]] || [[ ${result:l} == 'yes' ]]; then
    	eval $*
    else
    	echo 'canced!'
    fi
}


function resure_accept_line() {

	if [[ ${BUFFER} == "resure_exec *" ]]; then
		zle .accept-line
		return
	fi

	if [[ "${cmds[@]}" =~ ${BUFFER}  ]]; then
		BUFFER="rusure_exec ${BUFFER}"
		zle .accept-line
		return
	fi

	zle .accept-line
}

zle -N accept-line resure_accept_line


