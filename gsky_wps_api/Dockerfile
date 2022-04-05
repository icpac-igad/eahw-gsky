FROM node:14.7-alpine

# Install git
RUN apk update && apk add git

# Clone Repo
RUN git clone https://github.com/icpac-igad/gsky-wps-api.git /usr/src/app

# set work dir
WORKDIR /usr/src/app

RUN yarn install --production

EXPOSE 3000

CMD [ "yarn", "start" ]