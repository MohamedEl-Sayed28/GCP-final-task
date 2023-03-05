# GCP-final-task


## Tools
- Terraform
- Google Cloud Platform (GCP)


## Infrastructure for my project using terraform
Decribe instructions for initiate the project
```bash
terraform init 
terraform plan #to make sure everything will be created correctly
terraform apply #to apply the infrastructure on cloud provider 
```

Deploy and configure the application on the created K8s cluster 

## Build the app and redis then push them to GCR

Build image for the app using Dockerfile by
```bash
docker build -t python .
docker tag gcp-app eu.gcr.io/muhammed-mahoud/python
docker  push eu.gcr.io/muhammed-mahoud/python
```

```bash
docker pull redis
docker tag eu.gcr.io/muhammed-mahoud/redis
docker push eu.gcr.io/muhammed-mahoud/redis
```

![image](https://user-images.githubusercontent.com/101838529/215529747-28345d44-3cd1-4fc5-b69f-2ef9014fa4e0.png)

## The images pushed to GCR

![Screenshot from 2023-01-30 17-59-57](https://user-images.githubusercontent.com/101838529/215529401-f1b5b4ee-62da-4f9c-9b06-ee408abbbc4e.png)



## Deploy the app deployment and redis pod and Loadbalancer service in cluster 

```bash
kubectl create namespace gcp-final-task
kubectl create -f app-deployment.yaml
kubectl create -f redis-deployment.yaml
```





