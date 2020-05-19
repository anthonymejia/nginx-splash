From jwilder/docker-gen:latest
LABEL maintainer="Anthony Mejia <amejia1993@gmail.com>"

WORKDIR /app

# Install bash webserver
RUN apk -U add bash lighttpd

# Install Forego
ADD https://github.com/jwilder/forego/releases/download/v0.16.1/forego /usr/local/bin/forego
RUN chmod u+x /usr/local/bin/forego

# Copy docker gen template and Procfile
COPY index.tmpl Procfile ./

# Copy web assets
COPY public/icons/svg /var/www/localhost/htdocs/icons/svg
COPY public/styles.css public/index.html /var/www/localhost/htdocs/

EXPOSE 80
ENTRYPOINT []
CMD ["forego", "start", "-r"]
