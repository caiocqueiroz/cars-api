FROM mysql:5.7

ENV MYSQL_DATABASE=nodejs_rest_api
ENV MYSQL_ROOT_PASSWORD=D1g1perfil$

COPY ./db-bootstrap.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

