# Apache Airflow

## Setup Locally

```
cd apache_superset
docker-compose build
docker-compose up
```

## Default Login Credentials

```
username: admin
password: admin
```

## How to use Apache Superset

- Go to http://localhost:8088.
- Enter login credentials.
- Explore the application by clicking on any pre-loaded example dashboards.

## Deploy

- `cd airflow_application`
- Make sure you have **AWS EB CLI**, follow the instructions in this official [AWS Doc](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install-advanced.html).
- Initialize EB Application: `eb deploy`
