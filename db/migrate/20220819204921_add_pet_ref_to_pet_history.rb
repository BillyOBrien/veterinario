class AddPetRefToPetHistory < ActiveRecord::Migration[7.0]
  def change
    add_reference :pet_histories, :pet, null: false, foreign_key: true
  end
end
