require 'sinatra'

set :bind, '0.0.0.0'

get '/' do
  "Hello World - fixed #{params[:name]}".strip
end
