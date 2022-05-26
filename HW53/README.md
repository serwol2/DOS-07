##### 1. Создать namespace и развернуть в нем поду с nginx, настроить ограничения по 
cpu: 500m и memory 256. Реализовать с помощью yml файла

- minikube start
- minikube addons enable metrics-server
- файл p1.yaml
- kubectl apply -f p1.yaml
- kubectl get pods --namespace=hw53p1
- kubectl get pod hw53p1memcpu  --output=yaml --namespace=hw53p1
  или kubectl describe pod hw53p1memcpu  --namespace=hw53p1

screenshot-hw53-p1-1.png

- kubectl exec -it hw53p1memcpu --namespace=hw53p1 sh (зашел внутрь, посмотрел)
- kubectl port-forward hw53p1memcpu 8080:80 --namespace=hw53p1

screenshot-hw53-p1-2.png


- kubectl delete -f p1.yaml


- kubectl create deployment web --image=nginx -o yaml --dry-run=client > p1.yaml


##### 2. Развернуть поду с nginx, выгрузить конфигурацию поду в yml

- ubectl get pod hw53p1memcpu  --output=yaml --namespace=hw53p1 >p2-pod-config.yml

3. Развернуть кубернетес с помощью kubeadmin

4. Create deployment.yaml file and deploy any application (adminer, for example)
Deploy your own application from Docker HUB (private repo)

- взял образ сделаный мной ранее и загруженный на docker hub c приложением на python (из HW45) - выдает html страничку
- kubectl create secret generic dockerhub --from-file=.dockerconfigjson=config.json  --type=kubernetes.io/dockerconfigjson -n hw53p4
- kubectl  apply -f p4.yaml
- kubectl port-forward myapp 8888:80 -n hw53p4

screenshot-hw53-p1-4.png






https://dev.to/asizikov/using-github-container-registry-with-kubernetes-38fb


