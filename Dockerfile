FROM jenkins/ssh-agent

# Set the GID to the one of docker's group in the host machine
RUN groupadd -g 977 docker
RUN usermod -aG docker jenkins

RUN apt-get update && apt-get install -y \
    ca-certificates curl gnupg lsb-release \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

RUN apt-get update && apt-get install -y \
    docker-ce docker-ce-cli containerd.io \
    && rm -rf /var/lib/apt/lists/*

VOLUME /var/run/docker.sock
