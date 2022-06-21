FROM ubuntu
RUN apt-get update && apt-get install -y openssh-client
COPY HW16.sh /root/
ENV ADDR="127.0.0.1"
ENV PORT="22"
ENTRYPOINT cat /root/HW16.sh | ssh -p $PORT $ADDR 