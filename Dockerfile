FROM ruby:2.7.7-slim-buster

RUN groupadd -g 1000 devel; useradd -m -u 1000 -g 1000 devel
RUN apt update && \
    apt -y install git vim netcat \
      postgresql nginx git zip mc gnupg2 curl libpq-dev libreadline6-dev liblzma-dev \
      g++ make libyaml-dev autoconf libgdbm-dev libncurses5-dev automake libtool bison \
      pkg-config libffi-dev zlib1g-dev libsqlite3-dev sqlite3 libgmp-dev libgmp-dev libssl-dev gawk
 

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && apt install -y nodejs
RUN npm i -g yarn



USER devel
RUN gem install rails -v 6.1.7.3

WORKDIR /home/devel/prj

