class CreateStudyRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :study_records do |t|
      t.string :title, null: false
      t.text :content
      t.integer :study_cycle, null: false, default: 0
      t.integer :review_count, null: false, default: 0
      t.boolean :comprehension, null: false, default: false

      t.timestamps
    end
  end
end
