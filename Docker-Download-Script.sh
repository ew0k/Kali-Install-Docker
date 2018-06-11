# Run this script as root
# To add a user to the docker group, use the following command:
#   sudo usermod -aG docker <username>

# Download docker-ce
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh

# Download docker machine (**NOTE**: Check for newest version at https://github.com/docker/machine/releases)
#   If there is a new release, replace lines 11-13
curl -L https://github.com/docker/machine/releases/download/v0.14.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
    chmod +x /tmp/docker-machine &&
    sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

# Download docker-compose (**NOTE**: Check for newest version at https://github.com/docker/compose/releases)
#   If there is a new release, replace lines 17-18
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Test docker-ce
docker run --rm hello-world

# Test docker machine
docker-machine --version

# Test docker-compose
docker-compose --version

# Removing hello-world image
docker rmi hello-world:latest > /dev/null
