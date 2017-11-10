require 'sinatra'

set :bind, '0.0.0.0'

get '/' do
  "Hello World - Broken #{params[:name]}".strip
end
