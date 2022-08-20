class Pet < ApplicationRecord
  belongs_to :client
  has_many :pet_histories, dependent: :destroy
  def history_count(mascota)
    #TODO-implement
    Pet.includes(:pet_histories).references(:pet_histories).where("pet_histories.pet_id = ?", mascota).pluck(:pet_id).count
  end

  def avg_weight(mascota)
    #TODO-implement
    Pet.includes(:pet_histories).references(:pet_histories).where("pet_histories.pet_id = ?", mascota).average(:weight)
  end

  def avg_height(mascota)
    #TODO-implement
    Pet.includes(:pet_histories).references(:pet_histories).where("pet_histories.pet_id = ?", mascota).average(:heigth)
  end

  def max_weight(mascota)
    #TODO-implement
    Pet.includes(:pet_histories).references(:pet_histories).where("pet_histories.pet_id = ?", mascota).pluck(:weight).max#imum(:weight)
  end

  def max_height(mascota)
    #TODO-implement
    Pet.includes(:pet_histories).references(:pet_histories).where("pet_histories.pet_id = ?", mascota).pluck(:heigth).max#imum(:heigth)
  end

end
