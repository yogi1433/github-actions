#!/bin/bash
set -e
sudo yum update -y  

sudo wget -O /etc/yum.repos.d/jenkins.repo \
            https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum upgrade -y
sudo yum install unzip -y
# java
sudo yum install java-17-amazon-corretto -y
# jenkins
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
# kubeclt
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
sudo echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
# sudo install -o root -g root -m 0k755 ubectl /usr/local/bin/kubectl
sudo chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# aws-cli
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv.zip"
sudo unzip awscliv.zip
sudo ./aws/install

#eksctl
sudo curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
# sudo eksctl version
    
    # # Install Docker
sudo yum install -y docker
sudo service docker start
sudo usermod -aG docker ec2-user



    # curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    # echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list
    # apt-get update -y
    # apt-get install -y docker-ce docker-ce-cli containerd.io
    # usermod -aG docker ubuntu
    # systemctl enable docker
    # systemctl start docker

    # # Install kubectl
    # curl -o /usr/local/bin/kubectl https://amazon-eks.s3.ap-south-1.amazonaws.com/1.26.0/2023-10-02/bin/linux/amd64/kubectl
    # chmod +x /usr/local/bin/kubectl

    # Output Jenkins admin password
  sudo  cat /var/lib/jenkins/secrets/initialAdminPassword > /home/ec2-user/jenkins-password.txt
    sudo chown ec2-user:ec2-user /home/ec2-user/jenkins-password.txt












# #!/bin/bash
# set -e
# # Update packages and install Docker
# sudo yum update -y
# sudo yum install -y docker
# sudo service docker start
# sudo usermod -aG docker ec2-user

# # Add the Jenkins repository and import the GPG key
# sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
# sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# # Upgrade all packages
# sudo yum upgrade -y

# # Install Amazon Corretto 17 (Java 17)
# sudo yum install -y java-17-amazon-corretto

# # Install Jenkins
# sudo yum install jenkins -y

# # Reload systemd to recognize the Jenkins service
# sudo systemctl daemon-reload

# # Enable and start the Jenkins service
# sudo systemctl enable jenkins
# sudo systemctl start jenkins

# # Check the status of the Jenkins service
# sudo systemctl status jenkins
