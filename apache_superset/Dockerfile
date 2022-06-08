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

COPY . /app

ENV PYTHONPATH=. \
    FLASK_APP=superset

# 8088 gets connected to the reverse proxy in EB
EXPOSE 8088

# To start a development web server on port 8088, use -p to bind to another port
# CMD superset run -p 8088 --with-threads --reload --debugger
CMD superset run -p 8088 --host=0.0.0.0
