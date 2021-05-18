json.extract! film, :id, :title, :year, :genre, :company, :producer, :actors, :cost, :image_link, :created_at, :updated_at
json.url film_url(film, format: :json)
