json.extract! timer, :name, :starts_at, :description, :created_at, :updated_at
json.map_url timer.map_url
json.url timer_url(timer, format: :json)
