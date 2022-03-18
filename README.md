# Nginx Splash

A container to auto genearate a splash page for a [nginx-proxy](https://github.com/nginx-proxy/nginx-proxy). The container uses [docker-gen](https://github.com/jwilder/docker-gen) and a html template to create a splash page inspired by *chrome://apps*. 

![screenshot](https://github.com/anthonymejia/nginx-splash/blob/master/screenshot.png "screenshot")

## How To Use

The following docker compose illustrates how to use the container. Two environment variables (```SPLASH_ICON``` and ```SPLASH_NAME```) need to be added to any container that should be shown on the splash page. Setting the ```DEFAULT_HOST``` on the nginx-proxy container to the nginx-splash ```VIRTUAL_HOST``` will cause this container to become your homepage.
```
version: '2'

services:
  nginx-splash:
    image: anthonymejia/nginx-splash
    ports:
      - "80:80"
    environment:
      VIRTUAL_HOST: 'home'
      DEFAULT_HOST: 'home'
    volumes:
      - /var/run/docker.sock:/tmp/docker.sock:ro

  whoami:
    image: jwilder/whoami
    environment:
      VIRTUAL_HOST: 'whoami.test.lan'
      SPLASH_ICON: questions.svg
      SPLASH_NAME: Who Am I
```

## Available Icons

Use any of the icons shown [here](https://icons8.github.io/flat-color-icons/) to customize the look of the splash page.
