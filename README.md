# Jenkins Pipeline

## Tools Used

<p align="center">
<a href="https://www.terraform.io/" target="_blank" rel="noreferrer"> <img src="Images/terraform-original-wordmark.svg" alt="terraform" width="60" height="60"/> </a> <a href="https://www.ansible.com/" target="_blank" rel="noreferrer"> <img src="Images/ansible-original-wordmark.svg" alt="ansible" width="60" height="60"/> </a>  <a href="https://aws.amazon.com" target="_blank" rel="noreferrer"> <img src="Images/amazonwebservices-original-wordmark.svg" alt="aws" width="60" height="60"/> </a> <a width="60" height="60"/> </a> <a href="https://www.docker.com/" target="_blank" rel="noreferrer"> <img src="Images/docker-original-wordmark.svg" alt="docker" width="60" height="60"/> </a> <a href="https://www.jenkins.io" target="_blank" rel="noreferrer"> <img src="Images/jenkins-original.svg" alt="jenkins" width="60" height="60"/> </a> 
</p>
In this project we will:

* Bulid infrastructure on [AWS](https://aws.amazon.com/) using [Terraform](https://www.terraform.io/)
* Configure the environment using [Ansible](https://www.ansible.com/)
* Build simple node.js app using [Docker](https://www.docker.com/)
* Integrate all these tools with each other and build a pipelines using [Jenkins](https://www.jenkins.io/) to setup infrastructure and deploy our app
## Project infrastructure
![Build Status](Images/ter.jpg)

## Jenkins Configurations

### Plugins used 
* `Pipeline: AWS Steps` to add aws iam user creditionals 
* `Terraform` so jenkins can use terraform 
* `Ansible` so jenkins can use ansible 
## Pipelines 
* ## infrastructure pipeline:
     * that build the infrastructure on aws from this repo 
     
     * then ansible will configure the the private intance to  be ready as jenkins slave 
     by installing `open-jdk` and copy `agent.jar` file to it

     * config file is created by script in `jenkinsfile` 

     * the config file that created and `ansbile` use to reach the 
     private instance from bastion host: 
     ![Build Status](Images/Screenshot%20from%202022-05-25%2002-46-22.png)
    
    ### then from jenkins console connect the private instance like this:
    ![agent](Images/Screenshot%20from%202022-05-25%2003-01-47.png)
    ### now its connected and ready to host deployments
    ![agent](Images/Screenshot%20from%202022-05-25%2003-01-07.png)
* ## Node-app Deployment pipeline


    * jenkins deploy the app from this [forked repo](git@github.com:4mohamedalaa/jenkins_nodejs_example.git) 

    * the app need Enviroment variables and their values are created by `terraform` then copied to the private instance using `ansible`

    * this pipeline is triggered by the completeion of the `infrastructure pipeline`
## The result of this project 
* the application up and running 
![Build Status](Images/app.png)
* mysql database connected
![Build Status](Images/db.png)
*redis connection
![Build Status](Images/redis.png)

