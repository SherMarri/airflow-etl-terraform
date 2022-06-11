# Infrastructure Deployment

## Initialize Deployment EC2

- Initialize a new EC2 instance with the following configs:
  ```
  Instance Type: t2.medium
  Security Group: default
  Key Pair: Create or use an existing one
  ```
- Copy the _.pem_ file to _~/.ssh_ directory.
- Update permissions
  ```
  chmod 400 deploy.pem
  ```
- Update the inbound rules of EC2 instance's security group, so that your local machine can ssh into the EC2 instance.

## SSH to EC2

```
ssh -i "deploy.pem" ubuntu@ec2-54-201-179-213.us-west-2.compute.amazonaws.com
```

## Generate New SSH Key for GitHub

Generate key:

```
ssh-keygen -t ed25519 -C "marribaloch128@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

## Copy Public Key to GitHub SSH keys

Display public key:

```
cat ~/.ssh/id_ed25519.pub
```

## Clone the repo

```
git clone git@github.com:SherMarri/airflow-etl-terraform.git
```

## Install Terraform

```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
```

## Provision Infrastructure

```
terraform init
terraform plan
terraform apply
```

## Push the updated terraform state to git origin (master)

It is important to push the latest state to master after applying terraform infrastructure.

```
git add -A
git commit -m "Updated terraform state"
git push origin master
```

## Install AWS EB CLI

Inside project's root directory:

```
sudo apt install python3-pip
sudo apt install python3-virtualenv
virtualenv venv
source venv/bin/activate
pip install awsebcli
```

## Export AWS Credentials

```
export AWS_ACCESS_KEY_ID=<KeyValue>
export AWS_SECRET_ACCESS_KEY=<KeyValue>
```

## Deploy Airflow

```
cd airflow_application
eb deploy
```

## Deploy Superset

```
cd apache_superset
eb deploy
```
