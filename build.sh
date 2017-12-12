#!/bin/bash

case "$1" in
    cli)
        docker pull computermouth/sudeb:jessie
        docker run --privileged -v $PWD:/opt/builddir -w /opt/builddir --rm computermouth/sudeb:jessie /bin/bash -c "sudo apt-get update && sudo apt-get install -yqq git build-essential zip wget tar gzip && wget https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz && sudo tar -C /usr/local -xzf go1.8.3.linux-amd64.tar.gz && sudo ln -s /usr/local/go/bin/* /usr/bin/ && GOPATH=~/go make get && GOPATH=~/go make gadget_release && GOPATH=~/go make test && GOPATH=~/go make release && pushd build && zip -r ../build.zip ."
        ;;
    init)
        docker pull computermouth/sudeb:jessie
        docker run --privileged -v $PWD:/opt/builddir -w /opt/builddir --rm computermouth/sudeb:jessie /bin/bash -c "sudo apt-get update && sudo apt-get install -yqq git build-essential zip wget tar gzip && wget https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz && sudo tar -C /usr/local -xzf go1.8.3.linux-amd64.tar.gz && sudo ln -s /usr/local/go/bin/* /usr/bin/ && GOPATH=~/go make get && GOPATH=~/go make gadgetosinit_release && GOPATH=~/go make test && GOPATH=~/go make release && pushd build && zip -r ../build.zip ."
        ;;
esac
