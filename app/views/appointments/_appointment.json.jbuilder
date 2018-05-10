json.extract! appointment, :id, :item_date, :item_type, :item_description, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
