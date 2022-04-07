# EAHW Gsky Docker Image

The scripts under `gsky/build` are meant for building custom [GSKY](https://github.com/nci/gsky) docker images from scratch. To build a docker image, please run the following command:

```
cd gsky/build
docker build --build-arg gsky_repo="<gsky git repo>" gsky_branch="gsky repo branch" -t gsky_server .
```


# Build Arguments

1. `gsky_repo` - is an optional build argument to specify any git repository/branch other than http://github.com/nci/gsky.git. 
For example, for building from the [icpac's gsky fork](https://github.com/icpac-igad/gsky) we use the repo https://github.com/icpac-igad/gsky.git.

2. `gsky_branch` - optional branch to checkout the `gsky_repo`. Otherwise the repo's default branch will be used.

# Published Ports
The Dockerfile publishes port `8080` and `8888` for `GSKY ows` and `MAS API` services respectively. To access these ports from the host OS, one needs to use the -p option for docker run. For example, docker run --rm -it -p 8080:8080 <GSKY image>