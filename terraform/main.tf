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
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_redshift_cluster" "redshift_cluster" {
  cluster_identifier = "experimental-redshift-cluster"
  database_name      = var.redshift_db_name
  master_username    = var.redshift_user
  master_password    = var.redshift_password
  node_type          = "dc2.large"
  cluster_type       = "single-node"
}

resource "aws_db_instance" "airflow_db" {
  identifier          = "airflow-db"
  allocated_storage   = 10
  engine              = "postgres"
  engine_version      = "13.4"
  instance_class      = "db.t3.micro"
  name                = var.airflow_db_name
  username            = var.airflow_db_user
  password            = var.airflow_db_password
  skip_final_snapshot = true
  publicly_accessible = true
}

resource "aws_db_instance" "superset_db" {
  identifier          = "superset-db"
  allocated_storage   = 10
  engine              = "postgres"
  engine_version      = "13.4"
  instance_class      = "db.t3.micro"
  name                = var.superset_db_name
  username            = var.superset_db_user
  password            = var.superset_db_password
  skip_final_snapshot = true
  publicly_accessible = true
}

# Resource for Apache Airflow, Elastic Beanstalk
resource "aws_elastic_beanstalk_application" "airflow_app" {
  name = "airflow"
}

# Create elastic beanstalk Environment

resource "aws_elastic_beanstalk_environment" "airflow_app_env" {
  name                = "airflow-env"
  application         = aws_elastic_beanstalk_application.airflow_app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.4.16 running Docker"
  tier                = "WebServer"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "RootVolumeSize"
    value     = 32
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = 1
  }

  setting {
    namespace = "aws:ec2:instances"
    name      = "InstanceTypes"
    value     = "t2.large"
  }

}

# Resource for Apache Superset, Elastic Beanstalk
resource "aws_elastic_beanstalk_application" "superset_app" {
  name = "superset"
}

# Create elastic beanstalk Environment

resource "aws_elastic_beanstalk_environment" "superset_app_env" {
  name                = "superset-env"
  application         = aws_elastic_beanstalk_application.superset_app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.4.16 running Docker"
  tier                = "WebServer"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "RootVolumeSize"
    value     = 32
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = 1
  }

  setting {
    namespace = "aws:ec2:instances"
    name      = "InstanceTypes"
    value     = "t2.large"
  }
}
