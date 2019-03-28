class CreateMajors < ActiveRecord::Migration[5.1]
  def change
    create_table :majors do |t|
      t.references :tutor, foreign_key: true
      t.references :subject, foreign_key: true
      t.timestamps
    end
  end
end
