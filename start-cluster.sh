#!/bin/bash

function my_readlink() {
  case "$OSTYPE" in
    solaris*) echo "SOLARIS" ;;
    darwin*)
       echo $( cd "$1" ; pwd -P )
       ;;
    linux*)
       echo $(readlink -f $1)
        ;;
    bsd*)     echo "BSD" ;;
    *)        echo "unknown: $OSTYPE" ;;
  esac
}

PWD=$(pwd)
PWD_PATH=$(my_readlink $PWD)
SCRIPT_PATH=$(my_readlink $(dirname "$0"))
SCRIPT_NAME=$(basename "$0")
SCRIPT_DIR=$(dirname $SCRIPT_PATH)

if [ "$SCRIPT_PATH" == "$PWD" ]
then
	export SZD_HOME="$SCRIPT_PATH"
	export VOLUME_PATH="/opt/solrcloud"
	bash $SZD_HOME/solrcloud-3-nodes-zookeeper-ensemble/start.sh
else
	echo ""
	echo "execute:"
	echo ""
	echo "  cd "$SCRIPT_PATH
	echo "  ./"$SCRIPT_NAME
	echo ""
fi

