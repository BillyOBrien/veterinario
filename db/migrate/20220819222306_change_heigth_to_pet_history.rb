class ChangeHeigthToPetHistory < ActiveRecord::Migration[7.0]
  def change
    change_table :pet_histories do |t|
      t.change :heigth, :float
    end
  end
end
