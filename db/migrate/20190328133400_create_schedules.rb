class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.references :post, foreign_key: true
      t.string :day
      t.time :start_time
      t.time :end_time
      t.timestamps
    end
  end
end
