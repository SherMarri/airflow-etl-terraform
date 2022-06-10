# Apache Airflow

## Set DB String

Update SQL Alchemy connection string in `airflow.cfg` file.

```
sql_alchemy_conn=postgresql+psycopg2://<user>:<password>@<end-point>:<port>/<db_name>
```

## Setup Locally

```
cd airflow_application
docker-compose build
docker-compose up
```

## Default Login Credentials

```
username: admin
password: 10101
```

## How to use Airflow web?

- Go to http://localhost:8080.
- Enter login credentials.
- Click on any **DAG** to go to the DAG details page.
- Click the play icon on top right and select `Trigger DAG` option.
- The above action will fire the DAG, it should auto-refresh the state/status by default.

## Deploy

- `cd airflow_application`
- Make sure you have **AWS EB CLI**, follow the instructions in this official [AWS Doc](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install-advanced.html).
- Initialize EB Application: `eb deploy`
