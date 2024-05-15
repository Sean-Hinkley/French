json.extract! page, :id, :title, :section_id, :page_type, :permalink, :visible, :position, :content, :created_at, :updated_at
json.url page_url(page, format: :json)
