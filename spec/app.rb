$LOAD_PATH.unshift File.expand_path('..', __FILE__)
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'dotenv'
require 'sinatra'
require 'omniauth'
require 'omniauth-lyft'

Dotenv.load

enable :sessions

use OmniAuth::Builder do
  provider :lyft, 'raJvYFp-ZFhN', 'wRqziw1FYxz2iiL22i7d3HKe3p4qazSh', :scope => 'profile rides.request'
end

get '/' do
  <<-HTML
  <a href='/auth/lyft'>Sign in with Lyft</a>
  HTML
end

get '/auth/failure' do
  env['omniauth.error'].to_s
end

get '/auth/:name/callback' do
  auth = request.env['omniauth.auth']

  puts %(
    >> UID
      #{auth.uid.inspect}

    >> CREDENTIALS
      #{auth.credentials.inspect}

    >> INFO
      #{auth.info.inspect}
      #
    >> EXTRA
      #{auth.extra.inspect}
  )

  'Check logs for user information.'
end
