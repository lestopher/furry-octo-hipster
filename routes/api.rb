class Instasearch < Sinatra::Application
  before '/api/*' do
    response.headers['Content-Type'] = 'application/json;charset=utf-8'
  end

  namespace '/api' do
    namespace '/user' do
      get '/feed/?' do
        client = Instagram.client(access_token: session[:access_token])
        user = client.user
        p = Hash.new
        p[:max_id] = params[:id] if params[:id]

        recent_media = client.user_recent_media p

        if recent_media.pagination.next_max_id
          recent_media["next_api_params"] = {
            id: recent_media.pagination.next_max_id
          }
        end

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

    get '/tag/:tag/?' do
      client              = Instagram.client(access_token: session[:access_token])
      p                   = Hash.new
      p[:min_tag_id]      = params[:id] if params[:position] == 'after'
      p[:max_tag_id]      = params[:id] if params[:position] == 'before'
      puts p
      media               = client.tag_recent_media params[:tag], p

      if media.pagination.next_max_tag_id
        media["next_api_params"] = {
          tag: params[:tag],
          position: 'before',
          id: media.pagination.next_max_tag_id
        }
      end

      if media
        status 200
        media.to_json
      else
        status 500
        {
          message: "Tag failed?"
        }.to_json
      end
    end
  end
end
