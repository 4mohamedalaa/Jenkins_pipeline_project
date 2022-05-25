# Jenkins Pipeline

## Tools Used

<p align="center">
<a href="https://www.terraform.io/" target="_blank" rel="noreferrer"> <img src="Images/terraform-original-wordmark.svg" alt="terraform" width="40" height="40"/> </a> <a href="https://www.ansible.com/" target="_blank" rel="noreferrer"> <img src="Images/ansible-original-wordmark.svg" alt="ansible" width="40" height="40"/> </a>  <a href="https://aws.amazon.com" target="_blank" rel="noreferrer"> <img src="Images/amazonwebservices-original-wordmark.svg" alt="aws" width="40" height="40"/> </a> <a width="40" height="40"/> </a> <a href="https://www.docker.com/" target="_blank" rel="noreferrer"> <img src="Images/docker-original-wordmark.svg" alt="docker" width="40" height="40"/> </a> <a href="https://www.jenkins.io" target="_blank" rel="noreferrer"> <img src="Images/jenkins-original.svg" alt="jenkins" width="40" height="40"/> </a> 
</p>
In this project we will:

* Bulid infrastructure on [AWS](https://aws.amazon.com/) using [Terraform](https://www.terraform.io/)
* Configure the environment using [Ansible](https://www.ansible.com/)
* Build simple node.js app using [Docker](https://www.docker.com/)
* Integrate all these tools with each other and build a pipelines using [Jenkins](https://www.jenkins.io/) to setup infrastructure and deploy our app
## Project infrastructure
![Build Status](Images/ter.jpg)

## Preparing Jenkins master:
* Clone The repo:
```sh
git clone git@github.com:4mohamedalaa/Jenkins_pipeline_project.git
```
* Build the Dockerfile 
```sh
docker -f jenkins_dockerfile . -t master-node
```
* Run a docker container:
```sh
docker run -d -it -v /var/run/docker.sock:/var/run/docker.sock -v jenkins-data:/var/jenkins_home  -p 8081:8080 master_node
```