class Client < ApplicationRecord
  has_many :pets, dependent: :destroy
  def pet_count(cliente)
    #TODO-implement
    Client.includes(:pets).references(:pets).where("pets.client_id = ?", cliente).pluck(:client_id).count
  end
end
