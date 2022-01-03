#!/bin/zsh

source ${0:A:h}/yaml.sh

create_variables ${0:A:h}/config.yml

readonly _rus_cmds=(${cmds})
readonly _rus_ask=${ask}
readonly _rus_yes=${yes}
readonly _rus_no=${no}

unset cmds
unset ask
unset yes
unset no

function rusure_exec(){
	if [[ $# == 0 ]]; then
		return
	fi
    printf "${_rus_ask}(${_rus_yes}/${_rus_no}):"
    read result

    if [[ ${result:l} == 'y' ]] || [[ ${result:l} == 'yes' ]]; then
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


