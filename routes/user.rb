class Instasearch < Sinatra::Application
  namespace '/user' do
    get '/feed' do
      redirect '/' unless session[:access_token]

      slim :feed
    end
  end
end
