json.array!(@news) do |news|
  json.extract! news, :id, :title_pt, :title_es, :text_pt, :text_es, :user_id
  json.url news_url(news, format: :json)
end
