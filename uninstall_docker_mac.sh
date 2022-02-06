#!/bin/bash

# Uninstall Script

if [ "${USER}" != "root" ]; then
	echo "$0 must be run as root!"
	exit 2
fi

while true; do
  read -p "Remove all Docker Machine VMs? (Y/N): " yn
  case $yn in
    [Yy]* ) docker-machine rm -f $(docker-machine ls -q); break;;
    [Nn]* ) break;;
    * ) echo "Please answer yes or no."; exit 1;;
  esac
done

echo "Removing Applications..."
rm -rf /Applications/Docker.app

# from https://nektony.com/how-to/uninstall-docker-on-mac
echo "Removing Libraries"
rm -rf /Applications/Docker.app
rm -rf "~/Library/Application Scripts/com.docker.*"
rm -rf "~Library/Containers/com.docker.*"
rm -rf /Library/PrivilegedHelperTools/com.docker.vmnetd
rm -rf /Library/LaunchDaemons/com.docker.vmnetd.plist
rm -rf ~/.docker
rm -rf ~"/Library/Application Support/Docker Desktop"
rm -rf ~/Library/Preferences/com.docker.docker.plist
rm -rf ~/Library/Saved Application State/com.electron.docker-frontend.savedState
rm -rf ~/Library/Group Containers/group.com.docker
rm -rf "~/Library/Logs/Docker Desktop"
rm -rf ~/Library/Preferences/com.electron.docker-frontend.plist
rm -rf ~/Library/Cookies/com.docker.docker.binarycookies


echo "Removing docker binaries..."
rm -f /usr/local/bin/docker
rm -f /usr/local/bin/docker-machine
rm -r /usr/local/bin/docker-machine-driver*
rm -f /usr/local/bin/docker-compose



echo "Removing boot2docker.iso"
rm -rf /usr/local/share/boot2docker

echo "Forget packages"
pkgutil --forget io.docker.pkg.docker
pkgutil --forget io.docker.pkg.dockercompose
pkgutil --forget io.docker.pkg.dockermachine
pkgutil --forget io.boot2dockeriso.pkg.boot2dockeriso

echo "All Done!"
