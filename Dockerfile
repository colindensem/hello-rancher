FROM alpine:3.4
MAINTAINER Colin Densem <hello@summit360.co.uk>

RUN apk --no-cache --update add \
                            ruby \
                            ruby-json \
                            ruby-rake \
                            ruby-irb && \
    echo 'gem: --no-document' >> /etc/gemrc && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

ENV APP_HOME /app
WORKDIR $APP_HOME

ADD Gemfile $APP_HOME/  
ADD Gemfile.lock $APP_HOME/

RUN apk --update add --virtual build-dependencies build-base ruby-dev openssl-dev \  
    libc-dev linux-headers && \
    gem install bundler && \
    cd /app ; bundle install && \   
    apk del build-dependencies

#--without development test && \

# Upload source
ADD . $APP_HOME
RUN chown -R nobody:nogroup /app  
USER nobody


# Start server
ENV PORT 3000
EXPOSE 3000
CMD ["ruby", "app.rb"]
