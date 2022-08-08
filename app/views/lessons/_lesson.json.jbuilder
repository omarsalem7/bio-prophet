json.extract! lesson, :id, :title, :content, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
