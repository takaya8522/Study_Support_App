class CreateTimingResults < ActiveRecord::Migration[6.1]
  def change
    create_table :timing_results do |t|
      t.datetime :first_record
      t.datetime :second_record
      t.datetime :third_record
      t.datetime :fourth_record
      t.references :study_record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
