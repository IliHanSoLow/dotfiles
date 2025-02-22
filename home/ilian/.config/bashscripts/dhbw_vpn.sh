#!/usr/bin/env bash

dhbw_vpn(){
	SCRIPT_PATH=$( dirname ${BASH_SOURCE[0]} )
	echo $(sops -d  ${SCRIPT_PATH}/secrets.yaml | yq -r ".dhbw_pass") | sudo openconnect -u s242262 --authgroup Studenten --passwd-on-stdin drogon.dhbw-mannheim.de
}
