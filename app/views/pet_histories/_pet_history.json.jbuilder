json.extract! pet_history, :id, :weight, :heigth, :description, :created_at, :updated_at
json.url client_pet_pet_history_url(pet_history, format: :json)
