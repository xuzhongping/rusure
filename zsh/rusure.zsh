#!/bin/zsh

readonly _rus_config_path=${0:A:h}/config.yml
readonly _rus_cmds=("rm -rf /" "git checkout ." "git co ." "xzp")
readonly _rus_ask="This is a dangerous operation,are you sure?"
readonly _rus_yes='Y'
readonly _rus_no='N'

function rusure_exec(){
	if [[ $# == 0 ]]; then
		return
	fi
    printf "${_rus_ask}(${_rus_yes}/${_rus_no}):"
    read result

    if [[ ${result:l} == 'y' ]] || [[ ${result:l} == '_rus_yes' ]]; then
    	eval $*
    else
    	echo 'canced!'
    fi
}

function resure_accept_line() {
	if [[ ${BUFFER} =~ "^resure_exec " ]]; then
		zle .accept-line
		return
	fi
	matched='false'
	for cmd in ${_rus_cmds}; do
		if [[ "${cmd}" == "${BUFFER}" ]]; then
			matched='true'
			break
		fi
	done
	if [[ $matched == 'true' ]]; then
		BUFFER="rusure_exec ${BUFFER}"
		zle .accept-line
		return
	fi
	zle .accept-line
}

zle -N accept-line resure_accept_line

alias rusure=rusure_exec


