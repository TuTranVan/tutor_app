class CreateTutors < ActiveRecord::Migration[5.1]
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :gender
      t.date :dob
      t.string :phone
      t.string :address
      t.string :literacy
      t.string :avatar
      t.string :introduce
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
