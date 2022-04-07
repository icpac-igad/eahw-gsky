# EAHW Gsky Docker Compose

Configuration and instructions to run EAHW GSKY Services using docker-compose

## Dependencies

Execution requires:
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

# Installation
1. Start by cloning the repository from github to your execution environment

    ```
    git clone https://github.com/icpac-igad/eahw-gsky.git

    cd eahw-gsky
    ```

2. Create and update your `.env` file. You can find an example `.env.sample` file in the project root. The variables are described in detail in [this section](#environment-variables) of the documentation

    ```
    cp .env.sample .env
    ```

3. Build the images

    ```
    docker-compose build
    ```

    `NOTE:` When building for the first time, this might take some time, especially when building the gsky server image.

4. Run the services

    ```
    docker-compose up -d
    ```


# Environment Variables

- DB_NAME=<db_name>
- DB_USER=<db_user>
- DB_PASS=<db_pass>

- SECRET_KEY=
- ALLOWED_HOSTS=*,
- DEBUG=True
- FORCE_SCRIPT_NAME=

- HOST_DATA_ROOT_PATH=./gsky/data
- GSKY_CONFIG_FOLDER=./gsky/config
- GSKY_CONFIG_FILE=./gsky/config.json
- GSKY_INGEST_SCRIPT=./gsky/ingest.sh
- GSKY_WPS_TEMPLATES_VOLUME=./gsky/templates/WPS
- GSKY_RULESETS_VOLUME=./gsky/rulesets
- GSKY_OWS_HOST_NAME=gsky_server:8080
- GSKY_OWS_PROTOCOL=http
- OWS_BASE_URL=http://127.0.0.1/ows
 GSKY_WMS_GEOM_FILE_VOL=./gsky/gha.geojson

- GSKY_REPO=https://github.com/icpac-igad/gsky
- GSKY_BRANCH=

- GSKY_SERVER_TAG=latest
- GSKY_MANAGER_TAG=latest
- GSKY_WPS_API_TAG=latest
- MEMCACHED_TAG=1.6.12-alpine

- GSKY_NGINX_PORT=80

- RESTART_POLICY=no

- WEBHOOK_SECRET=

- CURRENT_UID=501