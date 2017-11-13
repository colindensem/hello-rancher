FROM iron/ruby
MAINTAINER Colin Densem <hello@summit360.co.uk>
#
# RUN apt-get update && \
#     apt-get install -y net-tools

# Install gems
ENV APP_HOME /app
# ENV HOME /root
# RUN mkdir $APP_HOME
WORKDIR $APP_HOME
# COPY Gemfile* $APP_HOME/
# RUN bundle install

# Upload source
ADD . $APP_HOME

# Start server
ENV PORT 3000
EXPOSE 3000
CMD ["ruby", "app.rb"]
