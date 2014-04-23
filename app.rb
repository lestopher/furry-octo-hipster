require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/assetpack'
# require 'sinatra/json'
require 'slim'
require 'pry' if ENV['RACK_ENV'] != 'production'
require 'bcrypt'
require 'instagram'
require 'json'
require 'less'

class Instasearch < Sinatra::Application
  register Sinatra::Namespace
  register Sinatra::AssetPack

  assets {
    serve '/js',      from: 'public/js'
    serve '/css',     from: 'public/css'
    # serve '/images',  from: 'public/images'

    js :app, 'public/js/app.js', [
      '/js/lib/**/*.js'
    ]

    css :application, 'public/css/application.css', [
      '/css/*'
    ]

    js_compression    :jsmin
    css_compression   :less
  }

  enable :logging if ENV['RACK_ENV'] != 'production'

  use Rack::Session::Cookie, :key => 'rack.session',
                             :path => '/',
                             :expire_after => 25920000,
                             :secret => 'This is a super secure key 123456.'

  CALLBACK_URL = "http://localhost:9292/oauth/callback"

  Instagram.configure do |config|
    config.client_id     = ENV['INSTAGRAM_CLIENT_ID']
    config.client_secret = ENV['INSTAGRAM_CLIENT_SECRET']
  end

  get '/' do
    if session[:access_token]
      slim :feed, :locals => { ngController: 'FeedListController' }
    else
      slim :index 
    end
  end
end

# require_relative 'models/init'
# require_relative 'helpers/init'
require_relative 'routes/init'
