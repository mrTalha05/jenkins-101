FROM jenkins/jenkins:2.414.2-jdk11

USER root

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    lsb-release \
    python3-pip \
    curl \
    gnupg \
    apt-transport-https \
    ca-certificates \
    software-properties-common

# Add Docker's official GPG key
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
Mohammed Jafrin
7:18 PM
# Set up Docker repository
RUN add-apt-repository \
   "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

# Install Docker CE CLI
RUN apt-get update && \
    apt-get install -y docker-ce-cli

USER jenkins

# Install Jenkins plugins
RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"
# Set up Docker repository
RUN add-apt-repository \
   "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

# Install Docker CE CLI
RUN apt-get update && \
    apt-get install -y docker-ce-cli

USER jenkins

# Install Jenkins plugins
RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"
