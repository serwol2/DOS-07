FROM ubuntu
RUN apt-get update && apt-get install -y ansible
COPY ansible.cfg /etc/ansible/
ENTRYPOINT ansible-playbook -i /ansible/hosts /ansible/playbook-p3.yml