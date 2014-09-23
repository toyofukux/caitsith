json.videos do
  json.array!(@videos) do |video|
    json.(video, :id, :title)
  end
end
