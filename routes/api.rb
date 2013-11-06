class Instasearch < Sinatra::Application
  before '/api/*' do
    response.headers['Content-Type'] = 'application/json;charset=utf-8'
  end

  namespace '/api' do
    namespace '/user' do
      get '/feed' do
        client = Instagram.client(access_token: session[:access_token])
        user = client.user
        recent_media = client.user_recent_media

        if recent_media
          status 200
          recent_media.to_json
        else
          status 500
          {
            message: "Something got jacked up."
          }.to_json
        end
      end
    end
  end
end
