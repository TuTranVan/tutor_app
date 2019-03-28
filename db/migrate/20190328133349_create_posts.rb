class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :type
      t.references :tutor, foreign_key: true
      t.references :student, foreign_key: true
      t.references :subject, foreign_key: true
      t.string :level
      t.string :title
      t.float :fee
      t.date :from_date
      t.date :to_date
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
