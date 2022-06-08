# airflow-etl-terraform

Set an ETL and BI infrastructure using RDS, Airflow, Redshift, Apache Superset and Terraform.

## Airflow

### Setup Locally

```
docker-compose build
docker-compose up
```

### Default Login Credentials

```
username: admin
password: 10101
```

### How to use Airflow web?

- Go to http://localhost:8080.
- Enter login credentials.
- Click on any **DAG** to go to the DAG details page.
- Click the play icon on top right and select `Trigger DAG` option.
- The above action will fire the DAG, it should auto-refresh the state/status by default.
