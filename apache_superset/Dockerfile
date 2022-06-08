FROM python:3.9.10-bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    postgresql-client \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-pip \
    libsasl2-dev \
    libldap2-dev \
    default-libmysqlclient-dev

RUN pip install --upgrade pip

WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

ENV PYTHONPATH=. \
    FLASK_APP=superset

RUN superset db upgrade
RUN pip install Pillow
RUN superset fab create-admin \
    --username admin \
    --firstname Superset \
    --lastname Admin \
    --email admin@superset.com \
    --password admin

# Load some data to play with
RUN superset load_examples


# Create default roles and permissions
RUN superset init

# 8088 gets connected to the reverse proxy in EB
EXPOSE 8088

# To start a development web server on port 8088, use -p to bind to another port
# CMD superset run -p 8088 --with-threads --reload --debugger
CMD superset run -p 8088 --host=0.0.0.0
