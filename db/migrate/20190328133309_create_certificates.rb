class CreateCertificates < ActiveRecord::Migration[5.1]
  def change
    create_table :certificates do |t|
      t.references :tutor, foreign_key: true
      t.string :school
      t.string :major
      t.string :grade
      t.string :course
      t.timestamps
    end
  end
end
