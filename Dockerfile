FROM ubuntu:20.04

LABEL maintainer="https://github.com/nickkostov" \
org.label-schema.docker.cmd="docker run -it  nickkostov/ansible:latest bash" \
org.label-schema.description="Ansible inside docker container" 

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y gnupg2 python3-pip sshpass git wget openssh-client && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean
    
RUN python3 -m pip install --upgrade pip cffi && \
    pip install ansible==2.10.3 && \
    pip install mitogen ansible-lint jmespath && \
    pip install --upgrade pywinrm

RUN mkdir /ansible/ && \
    mkdir -p /etc/ansible && \
    mkdir /ansible/hosts && \ 
    mkdir /ansible/playbook && \
    mkdir /ansible/.ssh 


#RUN /bin/git clone https://github.com/nickkostov/hosts.git ../ansible/

WORKDIR /ansible

#CMD [ "ansible-playbook", "--version" ]
