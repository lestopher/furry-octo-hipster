source "http://rubygems.org"

# web engine
gem "sinatra"
gem "sinatra-contrib"
gem "slim"
gem 'activerecord'
gem 'standalone_migrations'
gem 'rack'
gem 'activerecord-postgresql-adapter'
gem 'bcrypt-ruby', :require => 'bcrypt'
gem 'instagram'
gem 'json'

if RUBY_VERSION =~ /1.8/
  gem 'backports', '2.3.0'
  gem 'json'
end

if ENV['RACK_ENV'] != "production"
  gem 'rerun'
  gem "pry-debugger"
  gem "sqlite3"
  gem "foreman", "0.63.0"
  gem "thin", "1.5.1"
  gem "rake"
end