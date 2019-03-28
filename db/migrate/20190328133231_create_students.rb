class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :gender
      t.date :dob
      t.string :phone
      t.string :address
      t.string :literacy
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
