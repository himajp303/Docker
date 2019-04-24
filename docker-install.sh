#!/bin/bash
readonly DOCKER_EE_URL=$1
readonly DOCKER_EE_VERSION=$2

installEngine() {

  sudo apt-get -qq update

  sudo apt-get -qq install \
    apt-transport-https \
    curl \
    software-properties-common
  curl -fsSL "$DOCKER_EE_URL"/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository \
    "deb [arch=amd64] ${DOCKER_EE_URL}/ubuntu \
    $(lsb_release -cs) \
    ${DOCKER_EE_VERSION}"
  sudo apt-get -qq update
  sudo apt-get -qq install docker-ee > /dev/null
  echo "Finished installing Docker EE Engine"

}

main() {
  installEngine
}

main