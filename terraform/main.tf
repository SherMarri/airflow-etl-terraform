terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-west-2"
  access_key = "AKIASCG57UQ4EOHDPLGC"                     # TODO: Temporary, remove this after experimentation
  secret_key = "fxVL/cfFSreE3X5IQ3NSoR41hvSH0u0NaB2EuEjT" # TODO: Temporary, remove this after experimentation
}

resource "aws_redshift_cluster" "example" {
  cluster_identifier = "experimental-redshift-cluster"
  database_name      = "experimentaldb"
  master_username    = "experimentaluser"
  master_password    = "ExperimentalNotSoSecure1234Password"
  node_type          = "dc2.large"
  cluster_type       = "single-node"
}

resource "aws_db_instance" "airflow_db" {
  allocated_storage   = 10
  engine              = "postgres"
  engine_version      = "13.4"
  instance_class      = "db.t3.micro"
  name                = "airflow_db"
  username            = "foo"
  password            = "foobarbaz"
  skip_final_snapshot = true
  publicly_accessible = true
}

resource "aws_db_instance" "superset_db" {
  allocated_storage   = 10
  engine              = "postgres"
  engine_version      = "13.4"
  instance_class      = "db.t3.micro"
  name                = "superset_db"
  username            = "foo"
  password            = "foobarbaz"
  skip_final_snapshot = true
  publicly_accessible = true
}

# Resource for Apache Airflow, Elastic Beanstalk

# Resource for Apache Superset, Elastic Beanstalk
