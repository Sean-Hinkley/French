json.extract! events, :id, :title, :details, :created_at, :updated_at
json.url event_url(events, format: :json)
