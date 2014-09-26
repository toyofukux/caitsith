module Totec
  class API < Grape::API
    format :json
    formatter :json, Grape::Formatter::Jbuilder
    version '', using: :param
    resource :musics do
      get '/times', jbuilder: 'totec/times.json' do
        id = params[:id]
        @times = PlayHistory.select("music_id, count(music_id) as times").group(:music_id).order("count(music_id) desc")
        if id.blank?
          @times = @times.limit(100)
        else
          @times = @times.where("music_id = #{id}")
        end
      end
      get '/', jbuilder: 'totec/musics.json' do
        artist_id = params[:artist_id]
        title = params[:title]
        limit = params[:limit]
        start = params[:start]
        if artist_id.present? && title.present? && limit.present? && start.present?
          @musics = Music.order(:title).where("artist_id = #{artist_id} and title = #{title}").limit(limit).page(start)
        elsif artist_id.present? && title.present? && limit.present?
          @musics = Music.order(:title).where("artist_id = #{artist_id} and title = #{title}").limit(limit)
        elsif artist_id.present? && title.present?
          @musics = Music.order(:title).where("artist_id = #{artist_id}").where('title LIKE ?', "%#{title}%")
        elsif artist_id.present?
          @musics = Music.order(:title).where("artist_id = #{artist_id}")
        elsif title.present?
          #TODO
          #@musics = Music.order(:title).where('title LIKE ?', "%#{title}%")
          @musics = Music.order(:title).limit(100)
        elsif limit.present?
          @musics = Music.order(:title).limit(limit)
        else
          @musics = Music.order(:title).limit(100)
        end
      end
      get '/:id', jbuilder: 'totec/music.json' do
        id = params[:id]
        if id.present?
          @music = Music.find(id)
        #elsif
          #raise Totec::API::Totec404Exception.new("resource not found")
        end
      end
      params do
        requires :artist_id, type: Integer
        requires :title, type: String
      end
      post '/' do
        music = Music.create(artist_id: params[:artist_id], title: params[:title], outline: params[:outline])
        header 'Location', "http://54.168.135.155/api/musics/#{music.id}"
      end
      params do
        requires :artist_id, type: Integer
        requires :title, type: String
      end
      put '/:id' do
        id = params[:id]
        artist_id = params[:artist_id]
        title = params[:title]
        outline = params[:outline]
        if outline.present?
          music = Music.find(id).update_attributes(artist_id: artist_id, title: title, outline: outline)
        elsif
          music = Music.find(id).update_attributes(artist_id: artist_id, title: title)
        end
        status 204
      end
      params do
        requires :id, type: Integer
      end
      delete '/:id' do
        Music.destroy(params[:id])
        status 204
      end
      post '/:id/play' do
        PlayHistory.create(music_id: params[:id], created_at: Time.now)
        status 204
      end
    end
    #resource :playlists do
    #  post '/:name' do
    #    PlayList.create(name: params[:name], outline: params[:outline])
    #  end
    #end
    helpers do
      def music_exist?
        error!('404 not found', 404) unless @music
      end
    end
    #rescue_from Totec::API::Totec404Exception do |e|
    #  Rack::Response.new([ "Totec404Exception: #{e.message}" ], 404).finish
    #end
    #class Totec404Exception < Exception; end
  end
end

