module Takasing
  class API < Grape::API
    format :json
    formatter :json, Grape::Formatter::Jbuilder
    resource :videos do
      get '/', jbuilder: 'videos' do
        @videos = Video.all
      end
    end
  end
end
