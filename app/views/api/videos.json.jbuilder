json.videos do
  json.array!(@videos) do |video|
    json.id video.id
    json.title video.title
    json.thumburl video.thumbnail.url
  end
end
