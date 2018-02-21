#!/usr/bin/env bash

cloudHome=./solrcloud-3-nodes-zookeeper-ensemble/data

if [ -d ${cloudHome} ]
then
    rm -rf ${cloudHome}/*
fi

soloHome=./solrcloud/data

if [ -d ${soloHome} ]
then
    rm -rf ${soloHome}/*
fi
