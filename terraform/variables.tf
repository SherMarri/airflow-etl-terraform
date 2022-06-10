variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "secret_key" {
  description = "AWS Secret Key"
  type        = string
}

variable "redshift_db_name" {
  description = "Redshift DB Name"
  type        = string
  default     = "experimentaldb"
}

variable "redshift_user" {
  description = "Redshift User"
  type        = string
  default     = "experimentaluser"
}

variable "redshift_password" {
  description = "Redshift Password"
  type        = string
  default     = "ExperimentalNotSoSecure1234Password"
}


variable "airflow_db_name" {
  description = "Airflow DB Name"
  type        = string
  default     = "airflow_db"
}

variable "airflow_db_user" {
  description = "Airflow DB User"
  type        = string
  default     = "foo"
}

variable "airflow_db_password" {
  description = "Airflow DB Password"
  type        = string
  default     = "foobarbaz"
}

variable "superset_db_name" {
  description = "Superset DB Name"
  type        = string
  default     = "superset_db"
}

variable "superset_db_user" {
  description = "Superset DB User"
  type        = string
  default     = "foo"
}

variable "superset_db_password" {
  description = "Superset DB Password"
  type        = string
  default     = "foobarbaz"
}
