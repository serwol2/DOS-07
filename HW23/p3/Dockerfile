FROM ubuntu
RUN apt-get update && apt-get install -y ansible
COPY ansible.cfg /etc/ansible/
ENTRYPOINT ansible -i /ansible/hosts dev,prod -m ping