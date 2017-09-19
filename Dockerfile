FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
WORKDIR /tmp/
RUN apt-get update && apt-get install -y 
wget git build-essential openssl libreadline6 libreadline6-dev curl mysql-client libmysqlclient-dev openssl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison
RUN wget ftp://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz
RUN tar xvfz ruby-2.2.2.tar.gz
WORKDIR /tmp/ruby-2.2.2/
RUN ./configure
RUN make
RUN make install
RUN gem update --system 
RUN gem install bundler
RUN bundle config --global silence_root_warning 1
RUN bundle install
ENTRYPOINT ["/bin/bash"]
