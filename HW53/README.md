##### 1. Создать namespace и развернуть в нем поду с nginx, настроить ограничения по cpu: 500m и memory 256. 
Реализовать с помощью yml файла

- minikube start
- minikube addons enable metrics-server
- файл p1.yaml
- kubectl apply -f p1.yaml
- kubectl get pods --namespace=hw53p1
- kubectl get pod hw53p1memcpu  --output=yaml --namespace=hw53p1
  или kubectl describe pod hw53p1memcpu  --namespace=hw53p1

![N|Solid](./HW53-Kubernetes/HW53/screenshot-hw53-p1-1.png)

- kubectl exec -it hw53p1memcpu --namespace=hw53p1 sh (зашел внутрь, посмотрел)
- kubectl port-forward hw53p1memcpu 8080:80 --namespace=hw53p1

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW53-Kubernetes/HW53/screenshot-hw53-p1-2.png)

- kubectl delete -f p1.yaml

- kubectl create deployment web --image=nginx -o yaml --dry-run=client > p1.yaml

##### 2. Развернуть поду с nginx, выгрузить конфигурацию поду в yml

- ubectl get pod hw53p1memcpu  --output=yaml --namespace=hw53p1 >p2-pod-config.yml

##### 3. Развернуть кубернетес с помощью kubeadmin

- есть 2 машины с ubuntu
- на обоих машинках 
     sudo apt install docker.io
     добавляем в файл  /etc/docker/daemon.json

       {
       "exec-opts": ["native.cgroupdriver=systemd"],
	     "log-driver": "json-file",
	     "log-opts": {
  		     "max-size": "100m"
	      },
	     "storage-driver": "overlay2"
       }

     sudo systemctl restart docker
     
     https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/

     чтобы не заниматься открытием портов (как положено) отключаю файрвол: sudo systemctl stop ufw
     отключаю swap: sudo swapoff --all   (если надо - можно отключить насовсем в файле /etc/fstab удалив там соотв.строку)

      Update the apt package index and install packages needed to use the Kubernetes apt repository:

      sudo apt-get update
      sudo apt-get install -y apt-transport-https ca-certificates curl
      Download the Google Cloud public signing key:

      sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
      Add the Kubernetes apt repository:

      echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
      Update apt package index, install kubelet, kubeadm and kubectl, and pin their version:

      sudo apt-get update
      sudo apt-get install -y kubelet kubeadm kubectl
      sudo apt-mark hold kubelet kubeadm kubectl
  - на мастер-ноде: sudo kubeadm init --pod-network-cidr=172.16.0.0/16
    после выполнения делаю рекомандации в конце вывода команды:
          mkdir -p $HOME/.kube
          sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
          sudo chown $(id -u):$(id -g) $HOME/.kube/config
  - на воркер-ноде: sudo kubeadm join 192.168.31.5:6443 --token 0p42q9.gogjgpkuen8suukc --discovery-token-ca-cert-hash sha256:60d43f5aa3ecce638b3a4d6261d98841ccdd1371e1d370130ca4c1d56c823632   
  (эта строка из вывода прошлой команды на мастер-ноде)
  - на мастер ноде:
  
 ![N|Solid](https://github.com/serwol2/DOS-07/blob/HW53-Kubernetes/HW53/screenshot-hw53-p3-1-.png)


  https://projectcalico.docs.tigera.io/getting-started/kubernetes/quickstart

- на мастере kubectl create -f https://projectcalico.docs.tigera.io/manifests/tigera-operator.yaml
- на мастере kubectl apply -f calico.yaml  (в этом файле изменен адрес на 172.16.0.0/16)
- на мастере watch kubectl get pods -n calico-system

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW53-Kubernetes/HW53/screenshot-hw53-p3-2-.png)

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW53-Kubernetes/HW53/screenshot-hw53-p3-3-.png)

##### 4. Create deployment.yaml file and deploy any application (adminer, for example)
Deploy your own application from Docker HUB (private repo)

- взял образ сделаный мной ранее и загруженный на docker hub c приложением на python (из HW45) - выдает html страничку
- kubectl create secret generic dockerhub --from-file=.dockerconfigjson=config.json  --type=kubernetes.io/dockerconfigjson -n hw53p4
- kubectl  apply -f p4.yaml
- kubectl port-forward myapp 8888:80 -n hw53p4

![N|Solid](https://github.com/serwol2/DOS-07/blob/HW53-Kubernetes/HW53/screenshot-hw53-p1-4.png)


https://dev.to/asizikov/using-github-container-registry-with-kubernetes-38fb
