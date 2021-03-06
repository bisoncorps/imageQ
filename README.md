# ImageQ

Image search engine powered by Django

[![Python Django](https://img.shields.io/badge/Python-Django-blue.svg)](https://www.djangoproject.com/)

[![Build Status](https://travis-ci.com/bisoncorps/imageQ.svg?branch=master)](https://travis-ci.com/bisoncorps/imageQ)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[![Heroku App Status](http://heroku-shields.herokuapp.com/bisoncorps-imageq)](https://bisoncorps-imageq.herokuapp.com)

- [ImageQ](#ImageQ)
  - [Getting Started](#Getting-Started)
    - [Installation](#Installation)
      - [From Make File](#From-Make-File)
      - [Step by step Setup](#Step-by-step-Setup)
  - [Running Locally](#Running-Locally)
  - [Prediction API](#Prediction-API)
  - [Deploy](#Deploy)
  - [Usage](#Usage)
  - [Example](#Example)
  - [Code Documentation](#Code-Documentation)
  - [Code Structure](#Code-Structure)
  - [Todo](#Todo)

## Getting Started

Clone the repo

```bash
    # SSH
    git clone git@github.com:bisoncorps/imageQ.git
    # HTTPS
    git clone https://github.com/bisoncorps/imageQ.git
```

Activate virtual environment. All project work should be done in virtualenvs and virtualenv names must be added to gitignore

### Installation

#### From Make File
- You could easily run from project directory to setup project or follow through
```bash
    make
```

#### Step by step Setup

- Install the requirements

```bash
    # install pipenv
    sudo pip3 install pipenv

    # install requirements
    pipenv install
```


Install Postgres

```bash
    sudo apt-get install postgresql postgresql-contrib postgis
```

Create Postgres User

```bash
    sudo su postgres -c "psql -c \"CREATE USER imageq WITH PASSWORD 'imageq';\""
    sudo su postgres -c "psql -c \"CREATE DATABASE imageqdb OWNER imageq;\""
    sudo su postgres -c "psql -d imageqdb -c \"CREATE EXTENSION IF NOT EXISTS postgis;\""
    sudo su postgres -c "psql -d imageqdb -c \"CREATE EXTENSION IF NOT EXISTS postgis_topology;\""
```

Run migrations before starting the django-server

```bash
    python manage.py migrate
```

## Running Locally

To view the API locally on port 9000

```bash
    python manage.py runserver 9000
```

## Prediction API

The prediction API code can be found at the [repo](https://github.com/bisoncorps/imageQ_API)


## Deploy

The `master` branch of the repo is linked to automatically [deployed](https://bisoncorps-imageq.herokuapp.com)
![Homepage](docs/assets/homepage.png)
and it sends requests to the deployed [prediction API](http://172.104.78.30/predict)

## Usage

- Go to [ImageQ Search Engine](https://bisoncorps-imageq.herokuapp.com)

- Select an upload mode from dropdown i.e. (`Image URL`/`Upload`/`Camera(mobile)`)

- Select search engine to use i.e. (`Google`/`Yahoo`/`Bing`)

- Click `Search!` button

## Example

![Example-Result](docs/assets/result.png)

## Code Documentation

Code Documentation is available on [Github Pages](https://bisoncorps.github.io/imageQ)

## Code Structure

All important production settings are in the `ImageQ.settings.production.py` file.<br />
Settings should be inherited from `ImageQ.settings.common.py` for development or used as it is<br />
To change from local settings to production settings and vice-versa, change `current_settings` variable in `ImageQ.wsgi.py` accordingly<br />
All Celery async tasks are located in `tasks.py` of each app file in each app directory

## Todo

See [TODO](TODO.md) 

