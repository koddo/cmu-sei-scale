FROM ruby:2.3

RUN apt-get update && apt-get install -y \
            build-essential sqlite3 sqlite3-pcre ruby ruby2.3-dev rubygems-integration python libncurses5-dev libssl-dev libsqlite3-dev \
            global \
            && \
    apt-get -y autoclean && apt-get -y autoremove

RUN groupadd theuser && useradd --create-home --gid theuser theuser
WORKDIR /home/theuser
ENV HOME /home/theuser
USER theuser

RUN gem install bundler -v 1.9.10      # this is the latest 1.x, when trying 2.x it complains about version mismatch
RUN gem install json_pure

RUN git clone https://github.com/cmu-sei/SCALe
WORKDIR SCALe/scale.app
RUN chmod +x setup.sh restart.sh

RUN sed -i 's/http_basic_authenticate_with :name => "scale", :password => "Change_me!"/http_basic_authenticate_with :name => "scale", :password => "111"/g' \
           app/controllers/application_controller.rb

ENV SCALE_HOME=$HOME/SCALe
ENV GEM_HOME=$HOME/SCALEe/scale.app/vendor/bundle
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
RUN bundle install --binstubs
RUN ./setup.sh

ENTRYPOINT bundle exec thin start --port 8080




