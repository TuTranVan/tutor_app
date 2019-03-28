class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :tutor, foreign_key: true
      t.references :student, foreign_key: true
      t.string :score
      t.timestamps
    end
  end
end
