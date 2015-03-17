json.array!(@words) do |word|
  json.extract! word, :id, :eng, :spa
  json.url word_url(word, format: :json)
end
