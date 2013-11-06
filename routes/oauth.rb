class Instasearch < Sinatra::Application
  namespace '/oauth' do
    get '/connect' do
      redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
    end 

    get '/callback' do
      response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
      session[:access_token] = response.access_token
      redirect "/"
    end
  end
end
