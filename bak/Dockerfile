FROM ubuntu
RUN  apt-get update
RUN apt-get -y install mysql-client
RUN apt-get -y install zip unzip
COPY . .
CMD ./bak_sql.sh