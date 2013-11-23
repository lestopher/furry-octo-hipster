class Instasearch < Sinatra::Application
  namespace '' do
    get '/feed' do
      redirect '/' unless session[:access_token]

      slim :feed, :locals => { ngController: 'InstasearchFeedListController' }
    end

    get '/map' do
      slim :map, :locals => { :api => nil, :params => nil, :type => "map" }
    end

    get '/tag/:tag' do
      slim :feed, :locals => { ngController: 'TagListController' }
    end
  end
end
