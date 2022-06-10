# *** BEGIN common Dockerfile commands, to improve caching
# *** Please copy from Dockerfile.common
FROM python:3.9.10-bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    libspatialindex-dev \
    postgresql-client \
    libopenblas-base \
    libomp-dev

# improve docker layer caching by installing requirements.txt early & separately
COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt

# *** BEGIN service-specific customizations

COPY . /app

RUN mkdir -p /root/airflow && \
    cp /app/airflow.cfg /root/airflow/airflow.cfg


# 8080 gets connected to the reverse proxy in EB
EXPOSE 8080
# for environment variables that need to exist in both local + prod environments
ENV PYTHONPATH=. \
    AIRFLOW_HOME=/root/airflow

CMD ["/bin/bash", "./initialize_airflow.sh"]

HEALTHCHECK --interval=60s --start-period=10s --timeout=30s --retries=3 CMD curl -f http://localhost:8080/health || exit 1
# *** END service-specific customizations