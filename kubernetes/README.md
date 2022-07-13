# Deploy the Application to Kubernetes

Here I have two K8s yaml files. With this manual, I will walkyou thorough how to setup our react app in a K8s cluster with these two K8S files. 

</br>

# About
My Kubernetes cluster includes two pods and one master node.

In `deployment.yaml` file, I declared 2 replicas. I wanted to have more than one replica for resiliance and as less as possible due to the reason that I don't have enough resource on my local machine.

I've used minikube and docker deamon instead of a VM. One of the curses of using M1 chipped machine is not being able to use Vagrant. By this method, I've used containers as node.

</br>

## First File :  **deployment.yaml**

---

[In this file](./deployment.yaml) I've used the [docker image](https://hub.docker.com/repository/docker/yogun/react)that I pushed to my DockerHub registry. Due to the reason of I have limited resources on my local machine, I gave a CPU and Memory limit to this container. I opened 3000 port for React App, which is actually default port used by React App.

</br>

## Second File :  **deployment-service.yaml**

---

Kubernetes Pods are created and destroyed to match the desired state of our cluster. Pods are nonpermanent resources. Kubernetes can create and destroy Pods dynamically and every time they are created, they get new IP. This create a problem to communicate with them. This is why, I need an abstraction level on pods. 

[In this manifest file](./deployment-service.yaml), I use `Nodeport` service. It simply listen the Pod's port.  And exposes the Service on each Node's IP at a static port (the NodePort).

</br>

# Architecture

I've used two nodes in my machine and represent the architecture regarding that. Please remember that it may divert according to your own personal use, though it will provide a bare insight.
