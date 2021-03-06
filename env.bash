#!/usr/bin/env bash

########################################################################################################################
#
#     !!! WARNING !!!
#
#     Do not edit this file - its is base config file
#     For this case use env.custom.bash file and override variables there.
#
########################################################################################################################

#Application environment [dev|prod]
export ENV='prod'

#Application name - prefix for container names
export PROJECT_NAME='proxy-server'

#Default host - instead of missing page
export DEFAULT_HOST='default.host'

#Relative path to the volume directory
export VOLUME_DIRECTORY='volumes'

#Name of a private network. If it is need to edit this, must be updated docker-compose.yml file to!
export NETWORK_NAME='proxy-server'