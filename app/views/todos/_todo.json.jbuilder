json.extract! todo, :id, :title, :note, :completed, :user_id, :created_at, :updated_at
json.url todo_url(todo, format: :json)
