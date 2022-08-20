json.extract! pet, :id, :name, :race, :birthdate, :created_at, :updated_at
json.url client_pet_url(pet, format: :json)
