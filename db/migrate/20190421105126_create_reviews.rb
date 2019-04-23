class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :tutor, foreign_key: true
      t.references :student, foreign_key: true
      t.integer :score
      t.string :content
      t.timestamps
    end
  end
end
