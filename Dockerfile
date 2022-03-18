From jwilder/nginx-proxy:latest
LABEL maintainer="Anthony Mejia <amejia1993@gmail.com>"

COPY Procfile /app
COPY public  /app/public
COPY vhost.d /etc/nginx/vhost.d

CMD ["forego", "start", "-r"]
