json.extract! event, :id, :user_id, :date, :time, :public, :created_at, :updated_at
json.url event_url(event, format: :json)
