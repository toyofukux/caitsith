module Takasing
  class API < Grape::API
    format :json
    formatter :json, Grape::Formatter::Jbuilder
    resource :videos do
      get '/', jbuilder: 'videos.json' do
        Postamt.on(:slave) do
          @videos = Video.includes(:thumbnail).all
          #@videos = Video.includes(:thumbnail).where("thumbnails.url = ?", "http://www.1101.com/moteki_movie/images/head_01.jpg").references(:thumbnails)
        end
      end
    end
  end
end
