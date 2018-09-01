json.extract! favourite, :id, :url, :description, :created_at, :updated_at
json.url favourite_url(favourite, format: :json)
