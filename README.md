# airflow-etl-terraform

Set an ETL and BI infrastructure using RDS, Airflow, Redshift, Apache Superset and Terraform.

## Provisioning Resources

Follow the instructions in [TERRAFORM.md](TERRAFORM.md) to setup the resources required for this infrastructure.

## Apache Airflow

Follow the instructions in [AIRFLOW.md](AIRFLOW.md) to setup the Airflow.

## Apache Superset

Follow the instructions in [SUPERSET.md](SUPERSET.md) to setup the Superset.

### Setup Locally

```
cd apache_superset
docker-compose build
docker-compose up
```

### Default Login Credentials

```
username: admin
password: admin
```

### How to use Apache Superset

- Go to http://localhost:8088.
- Enter login credentials.
- Explore the application by clicking on any pre-loaded example dashboards.
