class CreateStudyTimings < ActiveRecord::Migration[6.1]
  def change
    create_table :study_timings do |t|
      t.datetime :first_timing
      t.datetime :second_timing
      t.datetime :third_timing
      t.datetime :fourth_timing
      t.references :study_record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
