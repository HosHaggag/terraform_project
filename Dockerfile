# create jenkins image with terraform installed inside 

FROM jenkins/jenkins:latest

USER root

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    software-properties-common \
    wget \
    unzip \
    vim \
    git \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*


# Install Terraform

RUN wget https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_amd64.zip \
    && unzip terraform_1.5.7_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && rm terraform_1.5.7_linux_amd64.zip

# Install AWS CLI 

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
&& unzip awscliv2.zip \
&& ./aws/install



   
